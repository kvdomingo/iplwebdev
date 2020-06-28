import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBRow as Row,
    MDBCol as Col,
    MDBTypography as Type,
    MDBCard as Card,
    MDBCardImage as CardImage,
    MDBCardBody as CardBody,
} from 'mdbreact';
import { Image } from 'cloudinary-react';
import Loading from '../Loading';
import './Members.scss';


const faculty = [
    {
        name: 'Dr. Caesar A. Saloma',
        publicId: 'Saloma',
        subgroup: 'Team One',
        slug: 'team-one',
        email: 'csaloma@nip.upd.edu.ph'
    },
    {
        name: 'Dr. Maricor N. Soriano',
        publicId: 'Soriano',
        subgroup: 'Video and Image Processing',
        slug: 'vip',
        email: 'msoriano@nip.upd.edu.ph'
    },
    {
        name: 'Dr. May T. Lim',
        publicId: 'Lim',
        subgroup: 'Complex Systems Team',
        slug: 'cx-team',
        email: 'mlim@nip.upd.edu.ph'
    },
    {
        name: 'Dr. Giovanni A. Tapang',
        publicId: 'Tapang',
        subgroup: 'Synchronization and BioOptics',
        slug: 'sync-bio-optics',
        email: 'gtapang@nip.upd.edu.ph'
    },
    {
        name: 'Dr. Johnrob Y. Bantang',
        publicId: 'Bantang',
        subgroup: 'Complexity Science Group',
        slug: 'complexity-science',
        email: 'jbantang@nip.upd.edu.ph'
    },
];

const technical = [
    {
        name: 'Anthony Paul N. Fox',
        publicId: '',
        role: 'University Research Associate',
        email: 'afox@nip.upd.edu.ph',
    },
    {
        name: 'Samantha Ruth C. Lahoz',
        publicId: '',
        role: 'Student Assistant',
        email: 'slahoz@nip.upd.edu.ph',
    },
];

export default class Members extends React.Component {
    state = {
        phd: [],
        ms: [],
        bs: [],
        loading: true,
    }

    componentDidMount() {
        fetch('/api/member')
            .then(res => res.json())
            .then(res => {
                let phd = res.filter(mem => (mem.status === 'graduate' && mem.suffix === 'M.S.')),
                    ms = res.filter(mem => (mem.status === 'graduate' && mem.suffix === '')),
                    bs = res.filter(mem => (mem.status === 'undergraduate'));
                this.setState({ phd, ms, bs, loading: false });
            });
    }

    render() {
        let students = [
            {
                members: this.state.phd,
                header: 'PhD Students'
            },
            {
                members: this.state.ms,
                header: 'MS Students'
            },
            {
                members: this.state.bs,
                header: 'BS Students'
            }
        ];
        if (this.state.loading) return <Loading />;
        else return (
            <React.Fragment>
                <Helmet>
                    <title>Members | Instrumentation Physics Laboratory</title>
                </Helmet>

                <Card className='card-image cover-photo'>
                    <div className='text-white d-flex h-100 align-items-end rgba-black-strong py-4 px-5'>
                        <div>
                            <Type tag='h2' variant='h5-responsive text-uppercase'>Instrumentation Physics Laboratory</Type>
                            <Type tag='h1' variant='display-4'>Members (A.Y. 2019-20)</Type>
                        </div>
                    </div>
                </Card>

                <Container fluid className='my-5 px-md-5'>
                    <section className='mb-5'>
                        <Type tag='h2' variant='h2-responsive'>PhD Faculty</Type>
                        <hr />
                        <Row className='row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5'>
                            {faculty.map((fac, i) => (
                                <Col className='mb-4'>
                                    <Card>
                                        <Image
                                            cloudName='kdphotography-assets'
                                            className='img-fluid'
                                            publicId={`ipl/${fac.publicId}`}
                                            secure
                                            responsive
                                            responsiveUseBreakpoints
                                            width='auto'
                                            dpr='auto'
                                            crop='scale'
                                            />
                                        <CardBody>
                                            <p>
                                                <span className='lead'>{fac.name}</span><br />
                                                {fac.subgroup}
                                            </p>
                                            <p><a href={`mailto:${fac.email}`}>{fac.email}</a></p>
                                        </CardBody>
                                    </Card>
                                </Col>
                            ))}
                        </Row>
                    </section>

                    <section className='mb-5'>
                        <Type tag='h2' variant='h2-responsive'>Technical Staff</Type>
                        <hr />
                        <Row className='row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5'>
                            {technical.map((fac, i) => (
                                <Col className='mb-4'>
                                    <Card>
                                        <Image
                                            cloudName='kdphotography-assets'
                                            className='img-fluid'
                                            publicId={`ipl/${fac.email.split('@')[0]}`}
                                            secure
                                            responsive
                                            responsiveUseBreakpoints
                                            width='auto'
                                            dpr='auto'
                                            crop='scale'
                                            defaultImage='default.png'
                                            />
                                        <CardBody>
                                            <p>
                                                <span className='lead'>{fac.name}</span><br />
                                                {fac.role}
                                            </p>
                                            <p><a href={`mailto:${fac.email}`}>{fac.email}</a></p>
                                        </CardBody>
                                    </Card>
                                </Col>
                            ))}
                        </Row>
                    </section>

                    {students.map(({ header, members }, i) => (
                        <section className='mb-5' key={i}>
                            <Type tag='h2' variant='h2-responsive'>{header} ({members.length})</Type>
                            <hr />
                            <Row className='row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5'>
                                {members.map((mem, j) => (
                                    <Col className='mb-4' key={j}>
                                        <Card>
                                            <Image
                                                cloudName='kdphotography-assets'
                                                className='img-fluid'
                                                publicId={`ipl/${mem.first_name[0].toLowerCase()}${mem.last_name.toLowerCase()}`}
                                                secure
                                                responsive
                                                responsiveUseBreakpoints
                                                width='auto'
                                                dpr='auto'
                                                crop='scale'
                                                defaultImage='default.png'
                                                />
                                            <CardBody>
                                                <p>{`${mem.first_name} ${mem.last_name}${mem.suffix ? ', ' + mem.suffix : ''}`}</p>
                                            </CardBody>
                                        </Card>
                                    </Col>
                                ))}
                            </Row>
                        </section>
                    ))}
                </Container>
            </React.Fragment>
        );
    }
}
