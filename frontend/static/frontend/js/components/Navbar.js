import React, { Suspense } from 'react';
import {
    MDBNavbar as Navbar,
    MDBNavbarBrand as NavbarBrand,
    MDBNavbarNav as NavbarNav,
    MDBNavItem as NavItem,
    MDBNavLink as NavLink,
    MDBNavbarToggler as NavbarToggler,
    MDBCollapse as Collapse,
} from 'mdbreact';
import { Image } from 'cloudinary-react';


const styles = {
    killShadow: {
        boxShadow: 'none',
    },
};

const navLinks = [
    { name: 'Home', path: '/' },
    { name: 'About', path: '/about' },
    { name: 'Research', path: '/research' },
    { name: 'Publications', path: '/publications' },
    { name: 'Members', path: '/members' },
    { name: 'Join', path: '/join' },
];

export default class Navigation extends React.Component {
    state = {
        isOpen: false,
        dark: true,
        logo: 'IPL_Logo-_White',
        color: '',
    }

    componentDidMount() {
        this.handleNav();
        document.addEventListener('scroll', this.handleNav);
    }

    componentWillUnmount() {
        document.removeEventListener('scroll', this.handleNav);
    }

    handleNav = () => {
        if (window.scrollY > 30) {
            this.setState({
                dark: false,
                logo: 'IPL_Logo',
                color: 'grey lighten-4',
            });
        } else {
            this.setState({
                dark: true,
                logo: 'IPL_Logo-_White',
                color: '',
            });
        }
    }

    toggleCollapse = () => {
        this.setState(prevState => ({ isOpen: !prevState.isOpen }));
    }

    render() {
        return (
            <Navbar
                dark={this.state.dark}
                light={!this.state.dark}
                expand='lg'
                className={`fixed-top ${this.state.color} navbar-slick`}
                style={styles.killShadow}
                >
                <NavbarBrand>
                    <Image
                        cloudName='kdphotography-assets'
                        publicId={`ipl/${this.state.logo}`}
                        secure
                        responsive
                        responsiveUseBreakpoints
                        dpr='auto'
                        height='60'
                        crop='scale'
                        />
                </NavbarBrand>
                <NavbarToggler onClick={this.toggleCollapse} />
                <Collapse isOpen={this.state.isOpen} navbar>
                    <NavbarNav right>
                        {navLinks.map(({ name, path }, i) => (
                            <NavItem>
                                <NavLink to={path}>{name}</NavLink>
                            </NavItem>
                        ))}
                    </NavbarNav>
                </Collapse>
            </Navbar>
        );
    }
}
