import React, { lazy } from 'react';
import { Route, Switch } from 'react-router-dom';

const Home = lazy(() => import('./Home/Home')),
      About = lazy(() => import('./About/About')),
      Err404 = lazy(() => import('./NotFound404'));

const routes = [
    { path: '/', name: 'Home', Component: Home, exact: true },
    { path: '/about', name: 'About', Component: About, exact: false },
];

export default (
    <Switch>
        {routes.map(({ path, Component, exact }) => (
            <Route key={path} exact={exact} path={path} component={Component} />
        ))}

        <Route key={404} status={404} path='*' component={Err404} />
    </Switch>
);
