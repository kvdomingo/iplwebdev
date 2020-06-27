import React, { lazy } from 'react';
import { Route, Switch } from 'react-router-dom';

const Home = lazy(() => import('./Home/Home')),
      About = lazy(() => import('./About/About')),
      Pubs = lazy(() => import('./Publications/Publications')),
      Profile = lazy(() => import('./Profile/Profile')),
      Research = lazy(() => import('./Research/Research')),
      Join = lazy(() => import('./Join/Join')),
      Err404 = lazy(() => import('./NotFound404'));

const routes = [
    { path: '/', name: 'Home', Component: Home, exact: true },
    { path: '/about', name: 'About', Component: About, exact: false },
    { path: '/publications', name: 'Publications', Component: Pubs, exact: true },
    { path: '/profile/:slug', name: 'Profile', Component: Profile, exact: false },
    { path: '/research', name: 'Research', Component: Research, exact: false },
    { path: '/join', name: 'Join', Component: Join, exact: true },
];

export default (
    <Switch>
        {routes.map(({ path, Component, exact }) => (
            <Route key={path} exact={exact} path={path} component={Component} />
        ))}

        <Route key={404} status={404} path='*' component={Err404} />
    </Switch>
);
