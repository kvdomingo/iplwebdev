--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-01-11 00:17:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 207 (class 1255 OID 16524)
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.last_updated = NOW();
	RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16594)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16621)
-- Name: awards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.awards (
    date_created timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    id integer NOT NULL,
    awardee character varying NOT NULL,
    award character varying NOT NULL,
    awarding_body character varying NOT NULL,
    year integer NOT NULL,
    url character varying
);


--
-- TOC entry 205 (class 1259 OID 16619)
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.awards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 205
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- TOC entry 204 (class 1259 OID 16601)
-- Name: publications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publications (
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    last_updated timestamp without time zone DEFAULT now() NOT NULL,
    id integer NOT NULL,
    pub_type character varying(3) NOT NULL,
    authors character varying NOT NULL,
    title character varying NOT NULL,
    journal character varying NOT NULL,
    volume integer,
    issue integer,
    month integer,
    year integer NOT NULL,
    page_start integer,
    page_end integer,
    url character varying,
    remarks character varying,
    subgroup character varying(3) NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 16599)
-- Name: publications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 203
-- Name: publications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.publications_id_seq OWNED BY public.publications.id;


--
-- TOC entry 2703 (class 2604 OID 16624)
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- TOC entry 2702 (class 2604 OID 16606)
-- Name: publications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publications ALTER COLUMN id SET DEFAULT nextval('public.publications_id_seq'::regclass);


--
-- TOC entry 2837 (class 0 OID 16594)
-- Dependencies: 202
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.alembic_version VALUES ('d91e4ff54ade');


--
-- TOC entry 2841 (class 0 OID 16621)
-- Dependencies: 206
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.991561', '2020-01-10 20:45:34.991561', 1, 'Caesar A. Saloma', 'Award for Continuing Excellence and Service (ACES)', 'Metrobank Foundation, Inc. (MBFI)', 2014, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.99458', '2020-01-10 20:45:34.99458', 2, 'Caesar A. Saloma', 'Who''s Who in Science and Engineering', 'Marquis', 2011, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.995561', '2020-01-10 20:45:34.995561', 3, 'Caesar A. Saloma', 'Asian Scientist', 'Ultimate List of 15 Asian Scientist to Watch', 2011, 'http://www.asianscientist.com/features/the-ultimate-list-15-asian-scientists-watch/');
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.995561', '2020-01-10 20:45:34.995561', 4, 'Caesar A. Saloma', 'Senior Member', 'Optical Society of America', 2010, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.996561', '2020-01-10 20:45:34.996561', 5, 'Caesar A. Saloma', 'Outstanding Science Administrator Award (Dioscoro L. Umali Medal)', 'DOST and NAST', 2010, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.996561', '2020-01-10 20:45:34.996561', 6, 'Caesar A. Saloma', 'Spotlight on: Excellent Researchers from Southeast Asia', 'SEA-EU-NET Mapping Study', 2009, 'http://www.sea-eu.net/object/document/20');
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.997563', '2020-01-10 20:45:34.997563', 7, 'Caesar A. Saloma', 'Lingkod Bayan Award - the Presidential Award for Outstanding Public Service', 'Civil Service Commission', 2008, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.997563', '2020-01-10 20:45:34.997563', 8, 'Caesar A. Saloma', 'Fellow', 'Samahang Pisika ng Pilipinas', 2008, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.998561', '2020-01-10 20:45:34.998561', 9, 'Caesar A. Saloma', 'Metrobank Foundation Outstanding Teacher Award', 'Metrobank Foundation, Inc. (MBFI)', 2007, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.998561', '2020-01-10 20:45:34.998561', 10, 'Caesar A. Saloma', 'Gawad Chanselor para sa Natatanging Guro (Outstanding Teacher)', 'University of the Philippines Diliman', 2006, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.999562', '2020-01-10 20:45:34.999562', 11, 'Caesar A. Saloma', 'Galileo Galilei Award', 'International Commission for Optics', 2004, 'http://e-ico.org/publications/newsletter/ico_apr05#Saloma');
INSERT INTO public.awards VALUES ('2020-01-10 20:45:34.999562', '2020-01-10 20:45:34.999562', 12, 'Caesar A. Saloma', 'Outstanding R&D Award in Basic Research (Eduardo Quisumbing Medal)', 'Department of Science and Technology, Philippines (DOST)', 1999, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.000523', '2020-01-10 20:45:35.000523', 13, 'Caesar A. Saloma', 'Third World Academy of Science (TWAS) Prize in Physics', 'NAST', 1997, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.000523', '2020-01-10 20:45:35.000523', 14, 'Caesar A. Saloma', 'Outstanding Young Scientist (Applied Physics)', 'National Academy of Science and Technology, Philippines (NAST)', 1992, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.001523', '2020-01-10 20:45:35.001523', 15, 'Maricor N. Soriano', 'PCIEERD 2018 R&D Award', 'PCIEERD', 2018, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.001523', '2020-01-10 20:45:35.001523', 16, 'Maricor N. Soriano', 'Ideaspace Incubation', 'Ideaspace', 2017, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.002524', '2020-01-10 20:45:35.002524', 17, 'Maricor N. Soriano', 'Leaders in Innovation Fellow Award', 'Newton Fund', 2015, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.002524', '2020-01-10 20:45:35.002524', 18, 'Maricor N. Soriano', 'The Outstanding Women in the Nation''s Service', 'TOWNS Foundation', 2013, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.003524', '2020-01-10 20:45:35.003524', 19, 'Maricor N. Soriano', 'Achievement Award in Physics', 'NRCP', 2010, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.003524', '2020-01-10 20:45:35.003524', 20, 'Maricor N. Soriano', 'Third World Academy of Science Prize in Physics', 'NAST', 2009, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.004523', '2020-01-10 20:45:35.004523', 21, 'Maricor N. Soriano', 'Outstanding Young Scientist', 'NAST', 2006, NULL);
INSERT INTO public.awards VALUES ('2020-01-10 20:45:35.004523', '2020-01-10 20:45:35.004523', 22, 'May T. Lim', 'Most Outstanding PhD Graduate', 'UP Diliman College of Science', 2002, NULL);


--
-- TOC entry 2839 (class 0 OID 16601)
-- Dependencies: 204
-- Data for Name: publications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.0045', '2020-01-11 00:05:43.0045', 68, 'reg', 'C Saloma', 'Measuring the Performance of the Philippine Scientific Enterprise System', 'Public Policy', 15, 2, NULL, 2016, 122, 161, 'https://drive.google.com/file/d/0B1UyokJX8r2KQUMyMnpIVWUzNFU/view', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.00646', '2020-01-11 00:05:43.00646', 69, 'reg', 'R. Cabral, S. Gaines, M. Lim, M. Atrigenio, S. Mamauag, G. Pedemonte, P. Aliño.', 'Siting marine protected areas based on habitat quality and extent provides the greatest benefit to spatially structured metapopulations', 'Ecosphere', 7, 11, 11, 2016, NULL, NULL, NULL, NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.007458', '2020-01-11 00:05:43.007458', 70, 'reg', 'D. Dailisan, M. Lim', 'Agent-based modeling of lane discipline in heterogeneous traffic.', 'Physica A: Statistical Mechanics and its Applications', 457, NULL, 9, 2016, NULL, NULL, NULL, NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.007458', '2020-01-11 00:05:43.007458', 71, 'reg', 'C. Saloma', 'Procurement in the philippine scientific enterprise system', 'Philippine Journal of Science', 145, 1, 3, 2016, NULL, NULL, NULL, NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.008458', '2020-01-11 00:05:43.008458', 72, 'reg', 'R. Batac', 'Statistical Properties of the Immediate Aftershocks of the 15 October 2013 Magnitude 7.1 Earthquake in Bohol, Philippines', 'Acta Geophysica', 64, NULL, NULL, 2015, NULL, NULL, 'https://doi.org/10.1515/acgeo-2015-0054', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.008458', '2020-01-11 00:05:43.008458', 73, 'reg', 'J. Pang, J. Bantang', 'Hodgkin–Huxley neurons with defective and blocked ion channels', 'Int. J. Mod. Phys. C', 26, NULL, NULL, 2015, NULL, NULL, 'https://doi.org/10.1142/S0129183115501120', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.037066', '2020-01-11 00:05:43.037066', 74, 'reg', 'A. Tarun, A. Paguirigan, R. Batac', 'Spatiotemporal recurrences of sandpile avalanches', 'Physica A', 436, NULL, NULL, 2015, NULL, NULL, 'https://doi.org/10.1016/j.physa.2015.05.016', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.038097', '2020-01-11 00:05:43.038097', 75, 'reg', 'JA Balista, C Saloma', 'Modified Inelastic Bouncing Ball Model for Describing the Dynamics of Granular Materials in a Vibrated Container', 'Physica D', 29, NULL, NULL, 2015, NULL, NULL, 'http://www.journals.elsevier.com/physica-d-nonlinear-phenomena/most-downloaded-articles/', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.038097', '2020-01-11 00:05:43.038097', 76, 'reg', 'Antonino Paguirigan Jr., Christopher Monterola, and Rene Batac', 'Loss of criticality in the avalanche statistics of sandpiles with dissipative sites', 'Communications in Nonlinear Science and Numerical Simulation', 20, 3, NULL, 2015, NULL, NULL, 'http://dx.doi.org/10.1016/j.cnsns.2014.06.020', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.03909', '2020-01-11 00:05:43.03909', 77, 'reg', 'C Saloma, GJ Perez, CA Gavile, JJ Ick-Joson, and C Palmes-Saloma', 'Prior individual training and self-organized queuing during group emergency escape of mice from water pool', 'PLOS ONE', 10, 2, NULL, 2015, NULL, NULL, 'http://dx.doi.org/10.1371/journal.pone.0118508', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.040091', '2020-01-11 00:05:43.040091', 78, 'reg', 'R.B. Cabral, P.M. Aliño, A.C.M. Balingit, C.M. Alis, H.O. Arceo, C.L. Nañola Jr, R.C. Geronimo, and MSN Partners', 'The Philippine Marine Protected Area (MPA)', 'Philippine Science Letters', 7, 2, NULL, 2014, NULL, NULL, NULL, NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.040091', '2020-01-11 00:05:43.040091', 79, 'reg', 'Rene C. Batac and Holger Kantz', 'Observing spatio-temporal clustering and separation using interevent distributions of regional earthquakes', 'Nonlinear Processes in Geophysics', 21, NULL, NULL, 2014, NULL, NULL, 'http://dx.doi.org/10.5194/npg-21-735-2014', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.04109', '2020-01-11 00:05:43.04109', 80, 'reg', 'Paul Leonard Atchong Hilario, Mark Jayson Villangca, and Giovanni Tapang', 'Independent light fields generated using a phase-only spatial light modulator', 'Optics Letters', 39, 7, NULL, 2014, NULL, NULL, 'http://dx.doi.org/10.1364/OL.39.002036', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.04109', '2020-01-11 00:05:43.04109', 81, 'reg', 'Annabelle Cruz-Trinidad, Porfirio M. Alino, Rollan C. Geronimo, Reniel B. Cabral', 'Linking food security with coral reefs and fisheries in the Coral Triangle', 'Coastal Management', 42, 2, NULL, 2014, NULL, NULL, 'http://dx.doi.org/10.1080/08920753.2014.877761', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.04209', '2020-01-11 00:05:43.04209', 82, 'reg', 'Richard N. Muallil, Samuel S. Mamauag, Reniel B. Cabral, Emerlinda O. Celeste-Dizon, Porfirio M. Aliño', 'Status, trends and challenges in the sustainability of small-scale fisheries in the Philippines: Insights from FISHDA (Fishing Industries'' Support in Handling Decisions Application) model', 'Marine Policy', 44, NULL, NULL, 2014, NULL, NULL, 'http://dx.doi.org/10.1016/j.marpol.2013.08.026', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.04209', '2020-01-11 00:05:43.04209', 83, 'reg', 'Reniel B. Cabral, Porfirio M. Aliño and May T. Lim', 'Modelling the impacts of fish aggregating devices (FADs) and fish enhancing devices (FEDs) and their implications for managing small-scale fishery, ICES', 'Journal of Marine Science', 71, 7, 9, 2014, NULL, NULL, 'http://dx.doi.org/10.1093/icesjms/fst229', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.043105', '2020-01-11 00:05:43.043105', 84, 'reg', 'James Christopher Pang, Christopher Monterola, and Johnrob Bantang', 'Noise induced synchronization in a lattice Hodgkin-Huxley neural network', 'Physica A', 393, NULL, NULL, 2014, NULL, NULL, 'https://dx.doi.org/10.1016/j.physa.2013.08.069', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.043105', '2020-01-11 00:05:43.043105', 85, 'reg', 'Samuel S. Mamauag, Porfirio M. Aliño, Renmar Jun S. Martinez, Richard N. Muallil, Maria Victoria A. Doctor, Emerlinda C. Dizon, Rollan C. Geronimo, Fleurdeliz M. Panga and Reniel B. Cabral', 'Tool for Understanding Resilience of Fisheries (TURF): A framework for assessing the vulnerability of coastal fisheries ecosystems to climate change', 'Fisheries Research', 147, NULL, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1016/j.fishres.2013.07.007', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.044128', '2020-01-11 00:05:43.044128', 86, 'reg', 'Christian Alis and May Lim', 'Spatio-Temporal Variation of Conversational Utterances on Twitter', 'PLoS ONE', 8, 10, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1371/journal.pone.0077793', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.045094', '2020-01-11 00:05:43.045094', 87, 'reg', 'Josephine Jill T. Cabatbat, Jica P. Monsanto, and Giovanni A. Tapang', 'Preserved network metrics across translated texts', 'International Journal of Modern Physics C', 25, 2, 9, 2013, NULL, NULL, 'http://dx.doi.org/10.1142/S0129183113500927', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.045094', '2020-01-11 00:05:43.045094', 88, 'reg', 'Erika Fille Legara, Christopher Monterola, and Clarissa David', 'Complex Network Tools in Building Expert Systems that Perform Framing Analysis', 'Expert Systems With Applications', 40, 11, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1016/j.eswa.2013.01.064', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.046112', '2020-01-11 00:05:43.046112', 89, 'reg', 'Reniel Cabral, Annabelle Cruz-Trinidad, Rollan Geronimo, Lydia Napitupulu, Paul Lokani, Delvene Boso, Christine Marie Casal, Nurulhuda Ahmad Fatan, and Porfirio Aliño', 'Crisis sentinel indicators: Averting a potential meltdown in the Coral Triangle', 'Marine Policy', 39, NULL, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1016/j.marpol.2012.10.012', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.046112', '2020-01-11 00:05:43.046112', 90, 'reg', 'Reniel B Cabral, Porfirio M Aliño, and May T Lim', 'A coupled stock-recruitment-age-structured model of the North Sea cod under the influence of depensation', 'Ecological Modelling', 253, NULL, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1016/j.ecolmodel.2012.12.031', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-11 00:05:43.047091', '2020-01-11 00:05:43.047091', 91, 'reg', 'Josephine Jill T Cabatbat and Giovanni A Tapang', 'Texting Styles and Information Change of SMS Text Messages in Filipino', 'International Journal of Modern Physics C', 24, 2, NULL, 2013, NULL, NULL, 'http://dx.doi.org/10.1142/S0129183113500022', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.702051', '2020-01-10 18:19:37.515444', 1, 'reg', 'DN Dailisan and MT Lim', 'Vehicular traffic modeling with greedy lane-changing and inordinate waiting', 'Physica A', 521, NULL, 2, 2019, NULL, NULL, 'https://doi.org/10.1016/j.physa.2019.01.107', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.704052', '2020-01-10 18:19:37.515444', 2, 'reg', 'AP Abella and MN Soriano', 'Detection and visualization of water surface three-wave resonance via a synthetic Schlieren method', 'Physica Scripta', 94, 3, 1, 2019, NULL, NULL, 'https://iopscience.iop.org/article/10.1088/1402-4896/aaf83a', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.705052', '2020-01-10 18:19:37.515444', 3, 'reg', 'C Saloma', 'Brain Drain and Inbreeding in the Training of Future Filipino Scientists', 'Philipp. J. Sci', 148, 1, 3, 2019, NULL, NULL, NULL, NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.705052', '2020-01-10 18:19:37.515444', 4, 'reg', 'WDG Improso, G Tapang and C Saloma', 'Suppression of Zeroth-Order Diffraction in Phase-Only Spatial Light Modulator', 'Chapter 1, Optics, Photonics and Laser Technology 2017, Springer Series in Optical Sciences 222, P. Ribeiro et al.', NULL, NULL, 7, 2019, 1, 30, 'https://doi.org/10.1007/978-3-030-12692-6_1', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.706052', '2020-01-10 18:19:37.515444', 5, 'reg', 'C Saloma', 'Valuable Lessons from a Decade of ERDT and ASTHRDP Implementation', 'Philipp. J. Sci', 148, 2, 6, 2019, NULL, NULL, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no2/EDITORIAL_Valuable_lessons_from_a_decade_of_ERDT_and_ASTHRDP_.pdf', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.706052', '2020-01-10 18:19:37.515444', 6, 'reg', 'C Saloma', 'Journal Status Report 2019', 'Philipp. J. Sci', 148, 3, 9, 2019, NULL, NULL, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no3/Editorial_Journal_Status_Report.pdf', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.707052', '2020-01-10 18:19:37.515444', 7, 'reg', 'Rubio LJM, Dailisan DN, Osorio MJP, David CC, Lim MT', 'Modeling the residential distribution of enrolled students to assess boundary-induced disparities in public school access', 'PLoS ONE', 14, 10, 10, 2019, NULL, NULL, 'https://doi.org/10.1371/journal.pone.0222766', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.707052', '2020-01-10 18:19:37.515444', 8, 'reg', 'HV Lee Jr, LMD Rosario, RB Tumlos, HJ Ramos, LMT Bo-Ot, and MN Soriano.', 'Excitation of O(1S) auroral green line from ambient air in a microwave-induced plasma jet at atmospheric pressure', 'Japanese Journal of Applied Physics', 57, 6, 6, 2018, 66102, NULL, 'https://doi.org/10.7567/JJAP.57.066102', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-10 18:19:37.515444', 9, 'reg', 'JAF Balista and CA Saloma', 'Modified inelastic bouncing ball model of the Brazil nut effect and its reverse', 'Granular Matter', 20, 3, 8, 2018, 47, NULL, 'https://doi.org/10.1007/s10035-018-0821-2', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-10 18:19:37.515444', 10, 'reg', 'C Saloma', 'Journal Status Report 2018', 'Philipp. J. Sci', 147, 3, 9, 2018, NULL, NULL, NULL, NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-10 18:19:37.515444', 11, 'reg', 'MA Alagao, MA Go, MN Soriano, and GA Tapang', 'Characterization of the performance of a 7-mirror segmented reflecting telescope via the angular spectrum method', 'Springer Series in Optical Sciences', 218, NULL, 10, 2018, 137, 157, 'https://doi.org/10.1007/978-3-319-98548-0_7', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.709053', '2020-01-10 18:19:37.515444', 12, 'reg', 'C. Saloma', 'Access to Tertiary Education (Editorial)', 'Phil. J Sc', 146, 4, 12, 2017, NULL, NULL, 'https://drive.google.com/file/d/1PKtMZXy8IYtyNoC1ohhOiow_H0i_7l7N/view', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.709053', '2020-01-10 18:19:37.515444', 13, 'reg', 'CDO Janer, D. Biton, and RC Batac', 'Incorporating space, time, and magnitude measures in a network characterization of earthquake events', 'Acta Geophysica', 65, 6, 11, 2017, 1153, 1166, 'https://doi.org/10.1007/s11600-017-0100-3', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.710053', '2020-01-10 18:19:37.515444', 14, 'reg', 'Bruzon, D.A., Tiongson, J.K., Tapang, G., Martinez, I.S.', 'Electroreduction and solubility of CO2in methoxy- and nitrile-functionalized imidazolium (FAP) ionic liquids', 'Journal of Applied Electrochemistry', 47, 11, 11, 2017, NULL, NULL, 'https://doi.org/10.1007/s10800-017-1117-7', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.710053', '2020-01-10 18:19:37.515444', 15, 'reg', 'Rosario, L.M.D., Salapare, H.S., Guittard, F., Tumlos, R.B., Soriano, M.N.', 'Topological characterization of plasma-etched polymer surface using discontinuous percolation transition', 'Materials Chemistry and Physics', 200, NULL, 10, 2017, NULL, NULL, 'https://doi.org/10.1016/j.matchemphys.2017.07.084', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.711053', '2020-01-10 18:19:37.515444', 16, 'reg', 'C. Saloma', 'Journal Status Report', 'Phil. J Sc', 146, 3, 9, 2017, NULL, NULL, 'https://drive.google.com/file/d/1DCEM6dELWF1Jn151qvNqvGER4U2P39At/view', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.711053', '2020-01-10 18:19:37.515444', 17, 'reg', 'AA Paguirigan Jr, MJG Angco, and JY Bantang', 'A fragmentation model of earthquake-like behavior in internet access activity', 'Int. J Mod. Phys. C', 28, 7, 6, 2017, NULL, NULL, 'DOI:10.1142/S0129183117500929', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.712054', '2020-01-10 18:19:37.515444', 18, 'reg', 'C Saloma', 'Measuring the performance of our higher education institutions Part II', 'Editorial, Phil. J Sc', 146, 2, 6, 2017, NULL, NULL, 'https://drive.google.com/file/d/0B1UyokJX8r2KclMtVTJOc1dhVGs/view', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.712054', '2020-01-10 18:19:37.515444', 19, 'reg', 'Batac, R.C., Paguirigan, A.A., Tarun, A.B., Longjas, A.G.', 'Sandpile-based model for capturing magnitude distributions and spatiotemporal clustering and separation in regional earthquakes', 'Nonlinear Processes in Geophysics', 24, 2, 4, 2017, NULL, NULL, 'https://doi.org/10.5194/npg-24-179-2017', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.713053', '2020-01-10 18:19:37.515444', 20, 'reg', 'Villacorta, R.B., Roque, K.F.J., Tapang, G.A., Jacinto, S.D.', 'Plant extracts as natural photosensitizers in photodynamic therapy: in vitro activity against human mammary adenocarcinoma MCF-7 cells', 'Asian Pacific Journal of Tropical Biomedicine', 7, 4, 4, 2017, NULL, NULL, 'https://doi.org/10.1016/j.apjtb.2017.01.025', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.713053', '2020-01-10 18:19:37.515444', 21, 'reg', 'Soriano, M.', 'Making sense of the sea on a shoestring: A review of cost-effective tools for coral reef visualization', 'AIP Conference Proceedings', 1871, NULL, 1, 2017, NULL, NULL, 'https://doi.org/10.1063/1.4996531', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.714053', '2020-01-10 18:19:37.515444', 22, 'spp', 'Ronilo Del Rosario, Caesar Aya-ay Saloma', 'An effective way to locate a Jollibee or McDonald''s store in the National Capital Region', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-01', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.714053', '2020-01-10 18:19:37.515444', 23, 'spp', 'Ciara De Ocampo Janer, Johnrob Yap Bantang, Rene Cabahug Batac', 'Robustness of the recurrence network analysis method with respect to data loss', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-03', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.715053', '2020-01-10 18:19:37.515444', 24, 'spp', 'Maria Loraine Ramos Menorca, May Tan Lim', 'Simulating network formation through in-person interaction in a limited budget environment', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-04', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.715053', '2020-01-10 18:19:37.515444', 25, 'spp', 'Michelle Tedlos Cirunay, Rene Cabahug Batac, Maricor N Soriano', 'Invariant statistical property throughout the road network evolution of Manila', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-05', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.716053', '2020-01-10 18:19:37.515444', 26, 'spp', 'Richmond L. Crisostomo, Johnrob Yap Bantang', 'Sunlight allocation in an L-system tree model', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-06', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.716053', '2020-01-10 18:19:37.515444', 27, 'spp', 'Joseph Roel Jaro Mabajen, May T. Lim', 'Price characterization of import goods from Customs dataset', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-07', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.717053', '2020-01-10 18:19:37.515444', 28, 'spp', 'Damian Nale Dailisan, May Lim', 'Jamming transitions in a mixed traffic cellular automata model', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-03', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.717053', '2020-01-10 18:19:37.515444', 29, 'spp', 'Adrian Chester M. Balingit, Damian N. Dailisan, May T. Lim', 'Mesoscopic simulation of road networks with time biasing of signalized intersections', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-04', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.719052', '2020-01-10 18:19:37.515444', 30, 'spp', 'Rafael Alberto Madera Bagood, Junius Andre F. Balista, Caesar Saloma', 'Modified inelastic bouncing ball model of the segregation of binary granular mixture: Numerical simulation', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-05', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.719052', '2020-01-10 18:19:37.515444', 31, 'spp', 'Merimae Sendaydiego Villamayor, Rene Cabahug Batac, Johnrob Yap Bantang', 'Cooperation levels of iterated Prisoner''s dilemma game with punishing agents and strategy update processes', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-06', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.720054', '2020-01-10 18:19:37.515444', 32, 'spp', 'Charles Jason Diaz, May T. Lim', 'Urbanization and barangay convexity relationship analysis', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-07', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.720054', '2020-01-10 18:19:37.515444', 33, 'spp', 'Roland Albert Austria Romero, Giovanni Alarkon Tapang, Caesar Aya-ay Saloma', 'High accuracy Philippine landfall prediction of Pacific cyclones at their genesis using neural networks', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-01', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.721053', '2020-01-10 18:19:37.515444', 34, 'spp', 'Kelvin Balaoro Bartilad, Damian Dailisan, May Lim', 'Estimating pedestrian traffic using bike share data', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-02', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.721053', '2020-01-10 18:19:37.515444', 35, 'spp', 'Louie John M. Rubio, Damian N. Dailisan, Maria Jeriesa P. Osorio, Clarissa C. David, May T. Lim', 'Assessing public elementary school quality in the Philippines', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-03', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-10 18:19:37.515444', 36, 'spp', 'John Paul Emmanuel Llenaresas Algodon, May Tan Lim', 'Interpolation reliability of Philippine rainfall measurements', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-05', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-10 18:19:37.515444', 37, 'spp', 'Joshua Jesli Dublado Santiago, Caesar Aya-ay Saloma', 'Self-organized criticality in an hourglass', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-07', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-10 18:19:37.515444', 38, 'spp', 'Rafael Christopher Tan Darilag, Alfred P. Abella, Maricor N. Soriano', 'Experimental simulation of eddy formation in Sibuyan and Bohol sea', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3D-06', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.723053', '2020-01-10 18:19:37.515444', 39, 'spp', 'Keara C Manlapaz, Sarah C. Johnson, Ciara Christianne Y Lim, Unico A Bautista', 'Low-dose neutron sterilization of E. voli: A preliminary study', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3D-07', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.724052', '2020-01-10 18:19:37.515444', 41, 'spp', 'Mark Jeremy Gacias Narag, Maricor Soriano', 'False positives reveal relationships among impressionist painters', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-01', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.724052', '2020-01-10 18:19:37.515444', 42, 'spp', 'Adrielle Theresa DL. Cusi, Giovanni A. Tapang, Caesar A. Saloma', 'Measurement of apparent Brownian motion diffusion coefficient under finite spatial and temporal detector resolution', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-02', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-10 18:19:37.515444', 43, 'spp', 'Ritz Ann P. Aguilar, Nathaniel Hermosa, Maricor N. Soriano', 'Low-cost Fourier ghost imaging using a photoresistor', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-03', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-10 18:19:37.515444', 44, 'spp', 'Rhei Joven Genove Juan, Maricor Narvaez Soriano', 'Effect of downsampling on the quality and resolution of super-resolved images', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-05', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-10 18:19:37.515444', 45, 'spp', 'Micholo Lanz Billones Medrana, Maricor Narvaez Soriano', 'Depth simulation of underwater images for data augmentation', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-06', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.726052', '2020-01-10 18:19:37.515444', 46, 'spp', 'Matthew Joseph Ribano Banaag, Johnrob Yap Bantang', 'Dynamics of a singular particle on a 1D oscillating floor', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2B-02', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.726052', '2020-01-10 18:19:37.515444', 47, 'spp', 'Archie Veloria, Gay Jane Perez, Giovanni Tapang, Josefino Comiso', 'From TRMM to GPM: verifying the continuity of satellite-derived rainfall through comparison with Philippine synoptic measurements', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3E-04', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.727051', '2020-01-10 18:19:37.515444', 48, 'spp', 'Paolo Rafael Deriquito Mawis, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Characterizing pixel crosstalk in a transmissive spatial light modulator', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-47', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.727051', '2020-01-10 18:19:37.515444', 49, 'spp', 'Eric Joshua Vincent Capuloy Reyes, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Point spread function robustness in galvanometer beam scanning', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-51', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.728051', '2020-01-10 18:19:37.515444', 50, 'spp', 'Anthony Paul Noquillo Fox, Giovanni Tapang, Caesar Saloma', 'Semiconductor laser optical feedback Mach-Zehnder interferometer', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-52', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.728051', '2020-01-10 18:19:37.515444', 51, 'spp', 'Hazel Glaine Labasan Sales, Giovanni Alarkon Tapang', 'Information flow in a dynamic weighted Erdös-Rényi network with different noise-enhanced node capacities', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-11', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.729053', '2020-01-10 18:19:37.515444', 52, 'spp', 'Jejomar Yape Derecho, May Tan Lim', 'Thematic trends in worldwide news reporting in the English language', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-15', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.729053', '2020-01-10 18:19:37.515444', 53, 'spp', 'Reinier Xander Azcueta Ramos, Johnrob Yap Bantang', 'Totalistic cellular automata model of a neuronal network on a spherical surface', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-16', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.730053', '2020-01-10 18:19:37.515444', 54, 'spp', 'Jamika Ann Estacio Roque, Giovanni A Tapang', 'Sub-millimeter wave transmission spectra of 2D polymer metamaterials using a Finite-Difference Time-Domain method', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-17', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.730053', '2020-01-10 18:19:37.515444', 55, 'spp', 'Hannah Christina Chan Arjonillo, Caesar Saloma', 'Curvature correction and Mie scattering in Monte Carlo analysis of propagating focused Gaussian beam in scattering media', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-20', NULL, 'ITO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.731053', '2020-01-10 18:19:37.515444', 56, 'spp', 'Ivan M. Fenis, Damian N. Dailisan, May Lim', 'Interplay of behavior and traffic dynamics at U-turn slots', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-22', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.731053', '2020-01-10 18:19:37.515444', 57, 'spp', 'Jan Parvin Bat-og Zoluaga, Giovanni Tapang', 'Correlation dendrograms based on word adjacency co-occurrence language network parameters', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-26', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-10 18:19:37.515444', 58, 'spp', 'Kristen Joyce Rino Cervantes, Giovanni Alarkon Tapang', 'Information flow in random networks with varying effective node capacities', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-28', NULL, 'SBO');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-10 18:19:37.515444', 59, 'spp', 'Kenneth Modesto Leo, May Tan Lim', 'Assortativity and resiliency of a Brownian bug network', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-29', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-10 18:19:37.515444', 60, 'spp', 'Sheenly Anne P. Saavedra, Johnrob Y. Bantang', 'Recurrence plot analysis of Internet access user activity', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-30', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.733052', '2020-01-10 18:19:37.515444', 61, 'spp', 'Samantha Ruth Centeno Lahoz, Johnrob Y. Bantang', 'Burst distributions in stochastic rate model of neuronal populations', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-31', NULL, 'CSG');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.733052', '2020-01-10 18:19:37.515444', 62, 'spp', 'Crizzia Mielle Mariano de Castro, May T. Lim', 'Determining senatorial voting archetypes through hyperspectral unmixing', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-32', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-10 18:19:37.515444', 63, 'spp', 'Kenneth V. Domingo, Maricor N. Soriano', 'Frequency domain reconstruction of stochastically sampled signals based on compressive sensing', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-38', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-10 18:19:37.515444', 64, 'spp', 'Cyd Kristoff Redelosa, May Lim', 'Traffic analysis zones-based resource allocation analysis using Uber Movement data', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-46', NULL, 'CXT');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-10 18:19:37.515444', 65, 'spp', 'Carl Jesse Raz Naces, Wilfredo Licuanan, Maricor Narvaez Soriano', 'Comparison of shadow rugosity versus chain-tape rugosity values from 3D coral reef models', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-51', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.735051', '2020-01-10 18:19:37.515444', 66, 'spp', 'Creo Baylon, Maricor Soriano', 'Increasing Picavet stability by extending the off-string axis', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-52', NULL, 'VIP');
INSERT INTO public.publications VALUES ('2020-01-08 02:51:05.766034', '2020-01-10 18:19:37.515444', 67, 'reg', 'RA Aguilar, NP Hermosa, and MN Soriano', 'Low-cost Fourier ghost imaging using a light-dependent resistor', 'American Journal of Physics', 87, 12, 12, 2019, NULL, NULL, 'https://aapt.scitation.org/doi/10.1119/10.0000163h5Q1NdpGjWVGA', 'Submitted by: Kenneth Domingo via /report-publication
Contact: kvdomingo@up.edu.ph.', 'VIP');


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 205
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.awards_id_seq', 22, true);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 203
-- Name: publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.publications_id_seq', 91, true);


--
-- TOC entry 2705 (class 2606 OID 16598)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2709 (class 2606 OID 16629)
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 16611)
-- Name: publications publications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2620 OID 16614)
-- Name: publications set_timestamp; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.publications FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


-- Completed on 2020-01-11 00:17:33

--
-- PostgreSQL database dump complete
--

