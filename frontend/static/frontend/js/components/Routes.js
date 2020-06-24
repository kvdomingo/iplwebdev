import React, { lazy } from 'react';
import { Route, Switch } from 'react-router-dom';

const Home = lazy(() => import('./Home/Home'));

const routes = [
    { path: '/', name: 'Home', Component: Home },
];

export default (
    <Switch>
        {routes.map(({ path, Component }) => (
            <Route key={path} path={path} component={Component} />
        ))}
    </Switch>
);
