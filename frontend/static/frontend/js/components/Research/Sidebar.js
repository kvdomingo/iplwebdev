import React from 'react';
import {
    MDBListGroup as ListGroup,
    MDBListGroupItem as ListGroupItem,
    MDBTypography as Type,
} from 'mdbreact';


export default function Sidebar({ data }) {
    const { pathname } = window.location;
    const navLinks = [
        {
            path: '/research',
            label: 'RESEARCH'
        },
        {
            path: `/research/team-one`,
            label: 'Team One'
        },
        {
            path: `/research/vip`,
            label: 'Video and Image Processing'
        },
        {
            path: `/research/sync-bio-optics`,
            label: 'Sync.Bio.Optics'
        },
        {
            path: `/research/cx-team`,
            label: 'Complex Systems Team'
        },
        {
            path: `/research/complexity-science`,
            label: 'Complexity Science Group'
        },
    ];

    return (
        <div className='px-3 px-md-0 mb-5'>
            <ListGroup className='list-group mb-4'>
                {navLinks.map(({ path, label }, i) => (
                    <ListGroupItem
                        key={path}
                        className={pathname === path ? 'blue-grey' : null}
                        style={pathname === path ? { border: '1px solid gray' } : null }
                        href={path}
                        active={pathname === path}
                        >
                        {label}
                    </ListGroupItem>
                ))}
            </ListGroup>
            {(Object.keys(data).length > 0)
                ? <div className='text-md-right'>
                    <Type tag='h4' variant='h5-responsive text-uppercase'>Faculty</Type>
                    <ul className='list-unstyled'>
                        {data.faculty.map((fac, i) => (
                            <li key={i}>
                                {`${fac.honorific} ${fac.first_name} ${fac.middle_name} ${fac.last_name}${fac.suffix ? ', ' + fac.suffix : ''}`}
                            </li>
                        ))}
                    </ul>

                    <hr />

                    <Type tag='h4' variant='h5-responsive text-uppercase'>Graduate Students</Type>
                    <ul className='list-unstyled'>
                        {data.graduate.map((grad, i) => (
                            <li key={i}>
                                {`${grad.first_name} ${grad.last_name}${grad.suffix ? ', ' + grad.suffix : ''}`}
                            </li>
                        ))}
                    </ul>

                    <hr />

                    <Type tag='h4' variant='h5-responsive text-uppercase'>Undergraduate Students</Type>
                    <ul className='list-unstyled'>
                        {data.undergraduate.map((grad, i) => (
                            <li key={i}>
                                {grad.first_name} {grad.last_name}
                            </li>
                        ))}
                    </ul>

                    <hr />
                </div>
                : null
            }
        </div>
    );
}
