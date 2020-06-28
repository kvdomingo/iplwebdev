import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBListGroup as ListGroup,
    MDBListGroupItem as ListGroupItem,
    MDBTypography as Type,
    MDBRow as Row,
    MDBCol as Col,
    MDBTable as Table,
    MDBTableBody as TableBody,
} from 'mdbreact';
import { withRouter } from 'react-router-dom';
import dateFormat from 'dateformat';
import Loading from '../Loading';


class Subgroup extends React.Component {
    state = {
        awards: [],
        description: '',
        inNews: [],
        members: {},
        name: '',
        projects: [],
        publications: [],
        loading: true,
    }

    componentDidMount() {
        let { slug } = this.props.match.params;
        fetch(`/api/subgroup?slug=${slug}`)
            .then(res => res.json())
            .then(res => {
                res = res[0];
                let { name, description } = res,
                    publications = res.publication_set.filter(({ publication_type }) => publication_type === 'reg').slice(0, 5),
                    members = {
                        faculty: res.member_set.filter(({ status }) => status === 'faculty'),
                        graduate: res.member_set.filter(({ status }) => status === 'graduate'),
                        undergraduate: res.member_set.filter(({ status }) => status === 'undergraduate'),
                    },
                    projects = res.project_set.map((r, i) => {
                        r.start_date = dateFormat(new Date(r.start_date), 'yyyy');
                        r.end_date = (r.end_date)
                            ? dateFormat(new Date(r.end_date), 'yyyy')
                            : 'present';
                        return r;
                    }),
                    inNews = res.news_set;
                this.props.handleHeadline(name);
                this.props.handleSidebar(members);
                this.setState({ name, description, members, projects, inNews, publications, loading: false });
            });
    }

    render() {
        if (this.state.loading) return <Loading />;
        else return (
            <div>
                <Helmet>
                    <title>{this.state.name} | Instrumentation Physics Laboratory</title>
                </Helmet>

                <section className='mb-5'>
                    <Type tag='h2' variant='h2-responsive' className='text-success mb-3'>Overview</Type>
                    <p>{this.state.description}</p>
                </section>

                <section className='mb-5'>
                    <Type tag='h2' variant='h2-responsive' className='text-success mb-3'>Recent Publications</Type>
                    <ListGroup>
                        {this.state.publications.map((pub, i) => (
                            <ListGroupItem key={i}>
                                <Row>
                                    <Col md='10'>
                                        {pub.authors}. {pub.title}, <i>{pub.journal}</i> ({pub.year}).
                                    </Col>
                                    <Col md='2' className='d-flex align-items-md-center justify-content-md-end'>
                                        <a href={pub.url} rel='noopener noreferrer' target='_blank' className='btn btn-sm btn-success ml-0'>Read</a>
                                    </Col>
                                </Row>
                            </ListGroupItem>
                        ))}
                    </ListGroup>
                </section>

                {this.state.projects.length === 0
                    ? null
                    : <section className='mb-5'>
                        <Type tag='h2' variant='h2-responsive' className='text-success mb-3'>Projects</Type>
                        <ListGroup>
                            {this.state.projects.map((proj, i) => (
                                <ListGroupItem key={i}>
                                    <div className='font-weight-bold'>{proj.name}</div>
                                    <Table hover small responsive>
                                        <TableBody>
                                            <tr>
                                                <td className='text-muted'>Project Leader</td>
                                                <td>{proj.project_leader}</td>
                                            </tr>
                                            {proj.collaborators
                                                ? <tr>
                                                    <td className='text-muted'>Collaborators</td>
                                                    <td>{proj.collaborators}</td>
                                                </tr>
                                                : null
                                            }
                                            {proj.funding
                                                ? <tr>
                                                    <td className='text-muted'>Funding</td>
                                                    <td>{proj.funding}</td>
                                                </tr>
                                                : null
                                            }
                                            <tr>
                                                <td className='text-muted'>Duration</td>
                                                <td>{proj.start_date} - {proj.end_date}</td>
                                            </tr>
                                        </TableBody>
                                    </Table>
                                    {proj.overview}
                                </ListGroupItem>
                            ))}
                        </ListGroup>
                    </section>
                }

                {this.state.inNews.length === 0
                    ? null
                    : <section className='mb-5'>
                        <Type tag='h2' variant='h2-responsive' className='text-success mb-3'>In the News</Type>
                        <ListGroup>
                            {this.state.inNews.map((news, i) => (
                                <ListGroupItem key={i}>
                                    <Row>
                                        <Col md='10'>
                                            {news.description} ({news.source}, {news.year})
                                        </Col>
                                        <Col md='2' className='d-flex align-items-md-center justify-content-md-end'>
                                            <a href={news.url} rel='noopener noreferrer' target='_blank' className='btn btn-sm btn-success ml-0'>Read</a>
                                        </Col>
                                    </Row>
                                </ListGroupItem>
                            ))}
                        </ListGroup>
                    </section>
                }
            </div>
        );
    }
}


export default withRouter(Subgroup);
