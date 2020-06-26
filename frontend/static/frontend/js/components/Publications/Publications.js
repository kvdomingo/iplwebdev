import React from 'react';
import Helmet from 'react-helmet';
import {
    MDBContainer as Container,
    MDBTypography as Type,
    MDBTabPane as TabPane,
    MDBTabContent as TabContent,
    MDBNav as Nav,
    MDBNavItem as NavItem,
    MDBNavLink as NavLink,
    MDBDataTable as DataTable,
} from 'mdbreact';
import Loading from '../Loading';
import dateFormat from 'dateformat';


export default class Publications extends React.Component {
    state = {
        activeItem: 2020,
        data: {},
        loading: true,
        type: 'reg',
    }

    componentDidMount() {
        this.getData(this.state.activeItem, 'reg');
    }

    getData = (year, type) => {
        if (type === 'reg') {
            fetch(`/api/publication?year=${year}&publication_type=${type}`)
                .then(res => res.json())
                .then(data => {
                    let rawData = { ...data },
                        headers = ['authors', 'title', 'journal', 'volume', 'issue', 'month', 'url'],
                        rows = [];
                    let columns = [
                        {
                            label: 'Author(s)',
                            field: 'authors',
                            sort: 'asc',
                        },
                        {
                            label: 'Title',
                            field: 'title',
                            sort: 'asc',
                        },
                        {
                            label: 'Journal',
                            field: 'journal',
                            sort: 'asc',
                        },
                        {
                            label: 'Vol.',
                            field: 'volume',
                            sort: 'desc',
                        },
                        {
                            label: 'Issue',
                            field: 'issue',
                            sort: 'desc',
                        },
                        {
                            label: 'Date',
                            field: 'month',
                            sort: 'desc',
                        },
                        {
                            label: 'Link',
                            field: 'url',
                            sort: 'asc',
                        },
                    ];

                    for (let raw in rawData) {
                        let row = {};
                        for (let head of headers) {
                            if (head === 'url') {
                                row[head] = <a href={rawData[raw][head]} rel='noopener noreferrer' target='_blank' className={`btn btn-sm ${rawData[raw][head] ? 'btn-primary' : 'blue-grey lighten-2 disabled'}`}>Read</a>
                            } else if (head === 'month') {
                                if (rawData[raw][head] != null) {
                                    let now = (new Date()).getFullYear();
                                    now = new Date(now, rawData[raw][head] - 1);
                                    row[head] = dateFormat(now, 'mmmm');
                                }
                            } else {
                                row[head] = rawData[raw][head];
                            }
                        }
                        rows.push(row);
                    }
                    this.setState({ data: { columns, rows }, loading: false });
                })
        } else if (type === 'spp') {
            fetch(`/api/publication?year=${year}&publication_type=${type}`)
                .then(res => res.json())
                .then(data => {
                    let rawData = { ...data },
                        headers = ['authors', 'title', 'url'],
                        rows = [];
                    let columns = [
                        {
                            label: 'Author(s)',
                            field: 'authors',
                            sort: 'asc',
                        },
                        {
                            label: 'Title',
                            field: 'title',
                            sort: 'asc',
                        },
                        {
                            label: 'Link',
                            field: 'url',
                            sort: 'asc',
                        },
                    ];

                    for (let raw in rawData) {
                        let row = {};
                        for (let head of headers) {
                            if (head !== 'url') row[head] = rawData[raw][head];
                            else {
                                row[head] = <a href={rawData[raw][head]} rel='noopener noreferrer' target='_blank' className={`btn btn-sm ${rawData[raw][head] ? 'btn-primary' : 'blue-grey lighten-2 disabled'}`}>Read</a>
                            }
                        }
                        rows.push(row);
                    }
                    this.setState({ data: { columns, rows }, loading: false });
                })
        }
    }

    toggleTab = (tab, type) => e => {
        if (this.state.activeItem !== tab || this.state.type !== type) {
            if (type === 'reg') this.setState({ type, activeItem: tab, loading: true });
            else if (type === 'spp') this.setState({ type, activeItem: `SPP ${tab}`, loading: true });
            this.getData(tab, type);
        }
    }

    render() {
        let pubYears = [2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013],
            sppYears = [2019];

        return (
            <Container fluid className='py-5 text-center'>
                <Helmet>
                    <title>Publications | Instrumentation Physics Laboratory</title>
                </Helmet>

                <Type tag='h1' variant='display-4'>Publications</Type>
                <Nav className='nav-tabs justify-content-center mt-5'>
                    {pubYears.map((year, i) => (
                        <NavItem key={i}>
                            <NavLink
                                link to='#'
                                active={this.state.activeItem === year}
                                onClick={this.toggleTab(year, 'reg')}
                                role='tab'
                                >
                                {year}
                            </NavLink>
                        </NavItem>
                    ))}
                    {sppYears.map((year, i) => (
                        <NavItem key={i}>
                            <NavLink
                                link to='#'
                                active={this.state.activeItem === `SPP ${year}`}
                                onClick={this.toggleTab(year, 'spp')}
                                role='tab'
                                >
                                SPP {year}
                            </NavLink>
                        </NavItem>
                    ))}
                </Nav>

                <TabContent activeItem={this.state.activeItem} className='py-4 px-5 text-left'>
                    {(this.state.loading)
                        ? <Loading />
                        : (this.state.type === 'reg')
                            ? pubYears.map((year, i) => (
                                <TabPane tabId={year} role='tabpanel' key={i}>
                                    <DataTable responsive hover data={this.state.data} />
                                </TabPane>
                            ))
                            : sppYears.map((year, i) => (
                                <TabPane tabId={`SPP ${year}`} role='tabpanel' key={i}>
                                    <DataTable responsive hover data={this.state.data} />
                                </TabPane>
                            ))
                    }
                </TabContent>
            </Container>
        );
    }
}
