import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
    MDBIcon as Icon,
} from 'mdbreact';
import { withRouter } from 'react-router-dom';
import { Image } from 'cloudinary-react';
import Loading from '../Loading';


class Profile extends React.Component {
    state = {
        loading: true,
        data: [],
        awards: [],
    }

    componentDidMount() {
        let { slug } = this.props.match.params;
        fetch('/api/profile')
            .then(res => res.json())
            .then(res => {
                this.setState({ data: res[slug] });
                this.getAwards();
            });
    }

    getAwards = () => {
        let awardee = this.state.data.fullName.split(' ').join('+');
        fetch(`/api/award?awardee=${awardee}`)
            .then(res => res.json())
            .then(awards => this.setState({ awards, loading: false }));
    }

    render() {
        if (this.state.loading) return <Loading />;
        else {
            let { data, awards } = this.state;
            return (
                <Container fluid className='py-md-5 px-md-5'>
                    <Helmet>
                        <title>{`${data.fullName} | Instrumentation Physics Laboratory`}</title>
                    </Helmet>

                    <Row>
                        <Col md='3'>
                            <Image
                                cloudName='kdphotography-assets'
                                className='img-fluid mb-4'
                                publicId={`ipl/${data.fullName.split(' ').slice(-1)[0]}`}
                                secure
                                responsive
                                responsiveUseBreakpoints
                                width='auto'
                                dpr='auto'
                                crop='scale'
                                />
                            <Type tag='h1' variant='h2-responsive'>{data.fullName}</Type>
                            <p className='text-muted'>{data.role}</p>

                            <hr style={{ borderWidth: 3, borderColor: 'rgba(black, 0.5)' }} className='my-4' />

                            <Type tag='h3' variant='h4-responsive' className='text-uppercase'>Contact</Type>
                            <Icon far icon='envelope' className='mr-2' />
                            <a href={data.contact[0].email}>{data.contact[0].email}</a>

                            <hr style={{ borderWidth: 3, borderColor: 'rgba(black, 0.5)' }} className='my-4' />
                            <Type tag='h3' variant='h4-responsive' className='text-uppercase'>Related</Type>
                            {data.references.map((reference, i) => (
                                <div key={i}>
                                    <a href={reference.href} target='_blank' rel='noopener noreferrer'>{reference.text}</a>
                                    <hr />
                                </div>
                            ))}
                        </Col>
                        <Col md='9' className='px-md-5'>
                            <div className='mb-5'>
                                <Type tag='h2' variant='h3-responsive text-success'>Academic Positions</Type>
                                <ul className='list-group'>
                                    {data.academic.map((acad, i) => (
                                        <li key={i} className='list-group-item'>{acad.position}, {acad.institution}</li>
                                    ))}
                                </ul>
                            </div>

                            <div className='mb-5'>
                                <Type tag='h2' variant='h3-responsive text-success'>Administrative Positions</Type>
                                <ul className='list-group'>
                                    {data.administrative.map((admin, i) => (
                                        <li key={i} className='list-group-item'>{admin.position}, {admin.institution}</li>
                                    ))}
                                </ul>
                            </div>

                            <div className='mb-5'>
                                <Type tag='h2' variant='h3-responsive text-success'>Awards and Recognitions</Type>
                                <ul className='list-group' ref={this.awardRef}>
                                    {awards.map((award, i) => (
                                        <li key={i} className='list-group-item'>
                                            {award.award}
                                            <br />
                                            <small className='text-muted'>{award.awarding_body}, {award.year}</small>
                                        </li>
                                    ))}
                                </ul>
                            </div>

                            <div className='mb-5'>
                                <Type tag='h2' variant='h3-responsive text-success'>Research Interests</Type>
                                <ul className='list-group'>
                                    {data.interests.map((interest, i) => (
                                        <li key={i} className='list-group-item'>{interest}</li>
                                    ))}
                                </ul>
                            </div>
                        </Col>
                    </Row>
                </Container>
            );
        }
    }
}


export default withRouter(Profile);
