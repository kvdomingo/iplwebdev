import React from 'react';
import {
    MDBListGroup as ListGroup,
    MDBListGroupItem as ListGroupItem,
    MDBTypography as Type,
} from 'mdbreact';


const relatedLinks = [
    {
        link: 'https://our.upd.edu.ph/files/calendar/regular/ACAD%20CAL%202019-2020.pdf',
        label: 'UP Diliman Calendar AY 2019-20'
    },
    {
        link: 'https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnxpbnN0cnVtZW50YXRpb25waHlzaWNzbGFifGd4OjIwNWVhZDExNzQwNDhhMGY',
        label: 'IPL Annual Report 2013'
    },
    {
        link: 'https://our.upd.edu.ph/files/catalogue/CS.pdf#page=8',
        label: 'BS Physics Course Curriculum'
    },
    {
        link: 'https://our.upd.edu.ph/files/catalogue/CS.pdf#page=10',
        label: 'BS Applied Physics (Instrumentation) Course Curriculum'
    },
    {
        link: 'https://our.upd.edu.ph/acadcat.php',
        label: 'UP Diliman General Catalogue 2014'
    },
    {
        link: 'https://our.upd.edu.ph/acadinf.php',
        label: 'UP Diliman Academic Information'
    },
];

export default function Sidebar() {
    const { pathname } = window.location;
    const navLinks = [
        {
            path: '/about',
            label: 'About Instru'
        },
        {
            path: `/about/principal-investigators`,
            label: 'Principal Investigators'
        },
        {
            path: `/about/history`,
            label: 'History'
        },
        {
            path: `/about/awards`,
            label: 'Awards and Recognitions'
        },
    ];

    return (
        <div className='px-3 px-md-0 mb-5'>
            <ListGroup className='list-group'>
                {navLinks.map(({ path, label }, i) => (
                    <ListGroupItem
                        key={path}
                        className={pathname === path ? 'blue-grey' : null}
                        href={path}
                        active={pathname === path}
                        >
                        {label}
                    </ListGroupItem>
                ))}
            </ListGroup>

            <hr />

            <Type tag='h3' variant='h4-responsive'>Contact us</Type>
            <p>
                +63 (2) 981 5800 loc. 3701-03
                <br />
                <a href='mailto:csaloma@nip.upd.edu.ph'>csaloma@nip.upd.edu.ph</a>
            </p>

            <hr style={{ borderWidth: 3 }} />

            <Type tag='h3' variant='h4-responsive' className='mb-4'>Related</Type>
            {relatedLinks.map(({ link, label }, i) => (
                <div key={link}>
                    <a href={link} rel='noopener noreferrer' target='_blank'>{label}</a>
                    <hr />
                </div>
            ))}
        </div>
    );
}
