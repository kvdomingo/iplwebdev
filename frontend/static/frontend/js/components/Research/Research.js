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
      Subgroup = lazy(() => import('./Subgroup'));

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
                            <Route path={`${path}/:slug`}>
                                <Subgroup
                                    handleSidebar={this.handleSidebar}
                                    handleHeadline={this.handleHeadline}
                                    />
                            </Route>
                        </Switch>
                    </Col>
                </Row>
            </React.Fragment>
        );
    }
}

export default withRouter(Research);
