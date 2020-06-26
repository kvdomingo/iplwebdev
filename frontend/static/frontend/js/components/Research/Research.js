import React, { lazy } from 'react';
import {
    MDBRow as Row,
    MDBCol as Col,
} from 'mdbreact';
import { Route, Switch, withRouter } from 'react-router-dom';
import Cover from './Cover';
import Sidebar from './Sidebar';
import './Research.scss';


const Landing = lazy(() => import('./Landing')),
      TeamOne = lazy(() => import('./TeamOne'));

class Research extends React.Component {
    state = {
        headline: '',
        sidebarDetails: [],
    }

    handleHeadline = headline => {
        this.setState({ headline });
    }

    handleSidebar = sidebarDetails => {
        this.setState({ sidebarDetails });
    }

    render() {
        const { path } = this.props.match;
        const routes = [
            { url: `${path}/team-one`, name: 'Team One', Component: TeamOne },
        ];

        return (
            <React.Fragment>
                <Cover headline={this.state.headline} />
                <Row className='d-flex flex-row-reverse my-5 px-2 px-md-5'>
                    <Col md='3'>
                        <Sidebar data={this.state.sidebarDetails} />
                    </Col>
                    <Col md='9'>
                        <Switch>
                            <Route exact path={path}>
                                <Landing handleHeadline={this.handleHeadline} />
                            </Route>
                            {routes.map(({ url, Component }, i) => (
                                <Route key={url} path={url}>
                                    <Component
                                        handleSidebar={this.handleSidebar}
                                        handleHeadline={this.handleHeadline}
                                        />
                                </Route>
                            ))}
                        </Switch>
                    </Col>
                </Row>
            </React.Fragment>
        );
    }
}

export default withRouter(Research);
