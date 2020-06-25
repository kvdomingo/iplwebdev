import React, { lazy } from 'react';
import {
    MDBRow as Row,
    MDBCol as Col,
} from 'mdbreact';
import { Route, Switch, withRouter } from 'react-router-dom';
import Cover from './Cover';
import Sidebar from './Sidebar';
import './About.scss';


const Landing = lazy(() => import('./Landing')),
      Principals = lazy(() => import('./Principals'));

class About extends React.Component {
    state = {
        headline: '',
    }

    handleHeadline = headline => {
        this.setState({ headline });
    }

    render() {
        const { path } = this.props.match;
        const routes = [
            { url: `${path}/principal-investigators`, name: 'Principal Investigators', Component: Principals },
        ];

        return (
            <React.Fragment>
                <Cover headline={this.state.headline} />
                <Row className='d-flex flex-row-reverse my-5 px-2 px-md-5'>
                    <Col md='3'>
                        <Sidebar />
                    </Col>
                    <Col md='9'>
                        <Switch>
                            <Route exact path={path}>
                                <Landing handleHeadline={this.handleHeadline} />
                            </Route>
                            {routes.map(({ url, Component }, i) => (
                                <Route key={url} path={url}>
                                    <Component handleHeadline={this.handleHeadline} />
                                </Route>
                            ))}
                        </Switch>
                    </Col>
                </Row>
            </React.Fragment>
        );
    }
}

export default withRouter(About);
