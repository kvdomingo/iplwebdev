import React from 'react';
import {
    MDBNavbar as Navbar,
    MDBNavbarBrand as NavbarBrand,
    MDBNavbarNav as NavbarNav,
    MDBNavItem as NavItem,
    MDBNavLink as NavLink,
    MDBNavbarToggler as NavbarToggler,
    MDBCollapse as Collapse,
} from 'mdbreact';
import { Link, withRouter } from 'react-router-dom';
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

class Navigation extends React.Component {
    state = {
        isOpen: false,
        dark: true,
        logo: 'IPL_Logo-_White',
        color: '',
        fixed: 'fixed-top',
    }

    componentDidMount() {
        this.handleNav();
        document.addEventListener('scroll', this.handleNav);
        this.changePageNavStyle(window.location.pathname);
        this.props.history.listen(() => this.changePageNavStyle(window.location.pathname));
    }

    componentDidUpdate(prevProps) {
        if (this.props.location.pathname !== prevProps.location.pathname) {
            window.scrollTo(0, 0);
            this.setState({ isOpen: false });
        }
    }

    componentWillUnmount() {
        document.removeEventListener('scroll', this.handleNav);
    }

    changePageNavStyle = (pathName) => {
        if (pathName === '/') {
            this.setState({
                logo: 'IPL_Logo-_White',
                color: '',
                dark: true,
                fixed: 'fixed-top',
            });
        } else {
            this.setState({
                logo: 'IPL_Logo',
                color: 'grey lighten-4',
                dark: false,
                fixed: 'sticky-top',
            });
        }
    }

    handleNav = () => {
        if (window.location.pathname === '/') {
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
        } else {
            this.setState({
                dark: false,
                logo: 'IPL_Logo',
                color: 'grey lighten-4',
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
                className={`${this.state.fixed} ${this.state.color} navbar-slick`}
                style={styles.killShadow}
                >
                <NavbarBrand>
                    <Link to='/'>
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
                    </Link>
                </NavbarBrand>
                <NavbarToggler onClick={this.toggleCollapse} />
                <Collapse isOpen={this.state.isOpen} navbar>
                    <NavbarNav right>
                        {navLinks.map(({ name, path }, i) => (
                            <NavItem key={path}>
                                <NavLink to={path}>{name}</NavLink>
                            </NavItem>
                        ))}
                    </NavbarNav>
                </Collapse>
            </Navbar>
        );
    }
}


export default withRouter(Navigation);
