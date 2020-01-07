CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	NEW.last_updated = NOW();
	RETURN NEW;
END;
$$;


CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


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
    doi character varying,
    remarks character varying
);


CREATE SEQUENCE public.publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publications_id_seq OWNED BY public.publications.id;
ALTER TABLE ONLY public.publications ALTER COLUMN id SET DEFAULT nextval('public.publications_id_seq'::regclass);


INSERT INTO public.alembic_version VALUES ('20a1770f4e8c');

INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.702051', '2020-01-08 02:33:39.702051', 1, 'reg', 'DN Dailisan and MT Lim', 'Vehicular traffic modeling with greedy lane-changing and inordinate waiting', 'Physica A', 521, NULL, 2, 2019, NULL, NULL, 'https://doi.org/10.1016/j.physa.2019.01.107', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.704052', '2020-01-08 02:33:39.704052', 2, 'reg', 'AP Abella and MN Soriano', 'Detection and visualization of water surface three-wave resonance via a synthetic Schlieren method', 'Physica Scripta', 94, 3, 1, 2019, NULL, NULL, 'https://iopscience.iop.org/article/10.1088/1402-4896/aaf83a', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.705052', '2020-01-08 02:33:39.705052', 3, 'reg', 'C Saloma', 'Brain Drain and Inbreeding in the Training of Future Filipino Scientists', 'Philipp. J. Sci', 148, 1, 3, 2019, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.705052', '2020-01-08 02:33:39.705052', 4, 'reg', 'WDG Improso, G Tapang and C Saloma', 'Suppression of Zeroth-Order Diffraction in Phase-Only Spatial Light Modulator', 'Chapter 1, Optics, Photonics and Laser Technology 2017, Springer Series in Optical Sciences 222, P. Ribeiro et al.', NULL, NULL, 7, 2019, 1, 30, 'https://doi.org/10.1007/978-3-030-12692-6_1', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.706052', '2020-01-08 02:33:39.706052', 5, 'reg', 'C Saloma', 'Valuable Lessons from a Decade of ERDT and ASTHRDP Implementation', 'Philipp. J. Sci', 148, 2, 6, 2019, NULL, NULL, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no2/EDITORIAL_Valuable_lessons_from_a_decade_of_ERDT_and_ASTHRDP_.pdf', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.706052', '2020-01-08 02:33:39.706052', 6, 'reg', 'C Saloma', 'Journal Status Report 2019', 'Philipp. J. Sci', 148, 3, 9, 2019, NULL, NULL, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no3/Editorial_Journal_Status_Report.pdf', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.707052', '2020-01-08 02:33:39.707052', 7, 'reg', 'Rubio LJM, Dailisan DN, Osorio MJP, David CC, Lim MT', 'Modeling the residential distribution of enrolled students to assess boundary-induced disparities in public school access', 'PLoS ONE', 14, 10, 10, 2019, NULL, NULL, 'https://doi.org/10.1371/journal.pone.0222766', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.707052', '2020-01-08 02:33:39.707052', 8, 'reg', 'HV Lee Jr, LMD Rosario, RB Tumlos, HJ Ramos, LMT Bo-Ot, and MN Soriano.', 'Excitation of O(1S) auroral green line from ambient air in a microwave-induced plasma jet at atmospheric pressure', 'Japanese Journal of Applied Physics', 57, 6, 6, 2018, 66102, NULL, 'https://doi.org/10.7567/JJAP.57.066102', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-08 02:33:39.708053', 9, 'reg', 'JAF Balista and CA Saloma', 'Modified inelastic bouncing ball model of the Brazil nut effect and its reverse', 'Granular Matter', 20, 3, 8, 2018, 47, NULL, 'https://doi.org/10.1007/s10035-018-0821-2', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-08 02:33:39.708053', 10, 'reg', 'C Saloma', 'Journal Status Report 2018', 'Philipp. J. Sci', 147, 3, 9, 2018, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.708053', '2020-01-08 02:33:39.708053', 11, 'reg', 'MA Alagao, MA Go, MN Soriano, and GA Tapang', 'Characterization of the performance of a 7-mirror segmented reflecting telescope via the angular spectrum method', 'Springer Series in Optical Sciences', 218, NULL, 10, 2018, 137, 157, 'https://doi.org/10.1007/978-3-319-98548-0_7', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.709053', '2020-01-08 02:33:39.709053', 12, 'reg', 'C. Saloma', 'Access to Tertiary Education (Editorial)', 'Phil. J Sc', 146, 4, 12, 2017, NULL, NULL, 'https://drive.google.com/file/d/1PKtMZXy8IYtyNoC1ohhOiow_H0i_7l7N/view', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.709053', '2020-01-08 02:33:39.709053', 13, 'reg', 'CDO Janer, D. Biton, and RC Batac', 'Incorporating space, time, and magnitude measures in a network characterization of earthquake events', 'Acta Geophysica', 65, 6, 11, 2017, 1153, 1166, 'https://doi.org/10.1007/s11600-017-0100-3', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.710053', '2020-01-08 02:33:39.710053', 14, 'reg', 'Bruzon, D.A., Tiongson, J.K., Tapang, G., Martinez, I.S.', 'Electroreduction and solubility of CO2in methoxy- and nitrile-functionalized imidazolium (FAP) ionic liquids', 'Journal of Applied Electrochemistry', 47, 11, 11, 2017, NULL, NULL, 'https://doi.org/10.1007/s10800-017-1117-7', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.710053', '2020-01-08 02:33:39.710053', 15, 'reg', 'Rosario, L.M.D., Salapare, H.S., Guittard, F., Tumlos, R.B., Soriano, M.N.', 'Topological characterization of plasma-etched polymer surface using discontinuous percolation transition', 'Materials Chemistry and Physics', 200, NULL, 10, 2017, NULL, NULL, 'https://doi.org/10.1016/j.matchemphys.2017.07.084', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.711053', '2020-01-08 02:33:39.711053', 16, 'reg', 'C. Saloma', 'Journal Status Report', 'Phil. J Sc', 146, 3, 9, 2017, NULL, NULL, 'https://drive.google.com/file/d/1DCEM6dELWF1Jn151qvNqvGER4U2P39At/view', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.711053', '2020-01-08 02:33:39.711053', 17, 'reg', 'AA Paguirigan Jr, MJG Angco, and JY Bantang', 'A fragmentation model of earthquake-like behavior in internet access activity', 'Int. J Mod. Phys. C', 28, 7, 6, 2017, NULL, NULL, 'DOI:10.1142/S0129183117500929', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.712054', '2020-01-08 02:33:39.712054', 18, 'reg', 'C Saloma', 'Measuring the performance of our higher education institutions Part II', 'Editorial, Phil. J Sc', 146, 2, 6, 2017, NULL, NULL, 'https://drive.google.com/file/d/0B1UyokJX8r2KclMtVTJOc1dhVGs/view', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.712054', '2020-01-08 02:33:39.712054', 19, 'reg', 'Batac, R.C., Paguirigan, A.A., Tarun, A.B., Longjas, A.G.', 'Sandpile-based model for capturing magnitude distributions and spatiotemporal clustering and separation in regional earthquakes', 'Nonlinear Processes in Geophysics', 24, 2, 4, 2017, NULL, NULL, 'https://doi.org/10.5194/npg-24-179-2017', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.713053', '2020-01-08 02:33:39.713053', 20, 'reg', 'Villacorta, R.B., Roque, K.F.J., Tapang, G.A., Jacinto, S.D.', 'Plant extracts as natural photosensitizers in photodynamic therapy: in vitro activity against human mammary adenocarcinoma MCF-7 cells', 'Asian Pacific Journal of Tropical Biomedicine', 7, 4, 4, 2017, NULL, NULL, 'https://doi.org/10.1016/j.apjtb.2017.01.025', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.713053', '2020-01-08 02:33:39.713053', 21, 'reg', 'Soriano, M.', 'Making sense of the sea on a shoestring: A review of cost-effective tools for coral reef visualization', 'AIP Conference Proceedings', 1871, NULL, 1, 2017, NULL, NULL, 'https://doi.org/10.1063/1.4996531', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.714053', '2020-01-08 02:33:39.714053', 22, 'spp', 'Ronilo Del Rosario, Caesar Aya-ay Saloma', 'An effective way to locate a Jollibee or McDonald''s store in the National Capital Region', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-01', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.714053', '2020-01-08 02:33:39.714053', 23, 'spp', 'Ciara De Ocampo Janer, Johnrob Yap Bantang, Rene Cabahug Batac', 'Robustness of the recurrence network analysis method with respect to data loss', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-03', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.715053', '2020-01-08 02:33:39.715053', 24, 'spp', 'Maria Loraine Ramos Menorca, May Tan Lim', 'Simulating network formation through in-person interaction in a limited budget environment', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-04', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.715053', '2020-01-08 02:33:39.715053', 25, 'spp', 'Michelle Tedlos Cirunay, Rene Cabahug Batac, Maricor N Soriano', 'Invariant statistical property throughout the road network evolution of Manila', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-05', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.716053', '2020-01-08 02:33:39.716053', 26, 'spp', 'Richmond L. Crisostomo, Johnrob Yap Bantang', 'Sunlight allocation in an L-system tree model', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-06', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.716053', '2020-01-08 02:33:39.716053', 27, 'spp', 'Joseph Roel Jaro Mabajen, May T. Lim', 'Price characterization of import goods from Customs dataset', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1F-07', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.717053', '2020-01-08 02:33:39.717053', 28, 'spp', 'Damian Nale Dailisan, May Lim', 'Jamming transitions in a mixed traffic cellular automata model', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-03', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.717053', '2020-01-08 02:33:39.717053', 29, 'spp', 'Adrian Chester M. Balingit, Damian N. Dailisan, May T. Lim', 'Mesoscopic simulation of road networks with time biasing of signalized intersections', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-04', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.719052', '2020-01-08 02:33:39.719052', 30, 'spp', 'Rafael Alberto Madera Bagood, Junius Andre F. Balista, Caesar Saloma', 'Modified inelastic bouncing ball model of the segregation of binary granular mixture: Numerical simulation', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-05', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.719052', '2020-01-08 02:33:39.719052', 31, 'spp', 'Merimae Sendaydiego Villamayor, Rene Cabahug Batac, Johnrob Yap Bantang', 'Cooperation levels of iterated Prisoner''s dilemma game with punishing agents and strategy update processes', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-06', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.720054', '2020-01-08 02:33:39.720054', 32, 'spp', 'Charles Jason Diaz, May T. Lim', 'Urbanization and barangay convexity relationship analysis', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2F-07', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.720054', '2020-01-08 02:33:39.720054', 33, 'spp', 'Roland Albert Austria Romero, Giovanni Alarkon Tapang, Caesar Aya-ay Saloma', 'High accuracy Philippine landfall prediction of Pacific cyclones at their genesis using neural networks', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-01', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.721053', '2020-01-08 02:33:39.721053', 34, 'spp', 'Kelvin Balaoro Bartilad, Damian Dailisan, May Lim', 'Estimating pedestrian traffic using bike share data', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-02', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.721053', '2020-01-08 02:33:39.721053', 35, 'spp', 'Louie John M. Rubio, Damian N. Dailisan, Maria Jeriesa P. Osorio, Clarissa C. David, May T. Lim', 'Assessing public elementary school quality in the Philippines', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-03', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-08 02:33:39.722052', 36, 'spp', 'John Paul Emmanuel Llenaresas Algodon, May Tan Lim', 'Interpolation reliability of Philippine rainfall measurements', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-05', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-08 02:33:39.722052', 37, 'spp', 'Joshua Jesli Dublado Santiago, Caesar Aya-ay Saloma', 'Self-organized criticality in an hourglass', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3F-07', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.722052', '2020-01-08 02:33:39.723053', 38, 'spp', 'Rafael Christopher Tan Darilag, Alfred P. Abella, Maricor N. Soriano', 'Experimental simulation of eddy formation in Sibuyan and Bohol sea', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3D-06', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.723053', '2020-01-08 02:33:39.723053', 39, 'spp', 'Keara C Manlapaz, Sarah C. Johnson, Ciara Christianne Y Lim, Unico A Bautista', 'Low-dose neutron sterilization of E. voli: A preliminary study', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3D-07', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.723053', '2020-01-08 02:33:39.723053', 40, 'spp', 'Erick John Carlo D Solibet, Melvin John Fernandez Empizo, Maria Cecilia Moralde Angub, Raymund Curioso Veloz, Christopher Jude Tan Vergara, Horace Andrew Fernandez Husay, Kohei Yamanoi, Toshihiko Shimizu, Arnel Angud Salvador, Nobuhiko Sarukura, Armando Soriano Somintac', 'Structural properties of hydrothermal-grown ZnO nanostructures fabricated using different ZnAc concentrations', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1E-03', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.724052', '2020-01-08 02:33:39.724052', 41, 'spp', 'Mark Jeremy Gacias Narag, Maricor Soriano', 'False positives reveal relationships among impressionist painters', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-01', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.724052', '2020-01-08 02:33:39.724052', 42, 'spp', 'Adrielle Theresa DL. Cusi, Giovanni A. Tapang, Caesar A. Saloma', 'Measurement of apparent Brownian motion diffusion coefficient under finite spatial and temporal detector resolution', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-02', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-08 02:33:39.725053', 43, 'spp', 'Ritz Ann P. Aguilar, Nathaniel Hermosa, Maricor N. Soriano', 'Low-cost Fourier ghost imaging using a photoresistor', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-03', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-08 02:33:39.725053', 44, 'spp', 'Rhei Joven Genove Juan, Maricor Narvaez Soriano', 'Effect of downsampling on the quality and resolution of super-resolved images', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-05', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.725053', '2020-01-08 02:33:39.725053', 45, 'spp', 'Micholo Lanz Billones Medrana, Maricor Narvaez Soriano', 'Depth simulation of underwater images for data augmentation', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-1C-06', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.726052', '2020-01-08 02:33:39.726052', 46, 'spp', 'Matthew Joseph Ribano Banaag, Johnrob Yap Bantang', 'Dynamics of a singular particle on a 1D oscillating floor', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-2B-02', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.726052', '2020-01-08 02:33:39.726052', 47, 'spp', 'Archie Veloria, Gay Jane Perez, Giovanni Tapang, Josefino Comiso', 'From TRMM to GPM: verifying the continuity of satellite-derived rainfall through comparison with Philippine synoptic measurements', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-3E-04', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.727051', '2020-01-08 02:33:39.727051', 48, 'spp', 'Paolo Rafael Deriquito Mawis, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Characterizing pixel crosstalk in a transmissive spatial light modulator', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-47', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.727051', '2020-01-08 02:33:39.727051', 49, 'spp', 'Eric Joshua Vincent Capuloy Reyes, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Point spread function robustness in galvanometer beam scanning', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-51', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.728051', '2020-01-08 02:33:39.728051', 50, 'spp', 'Anthony Paul Noquillo Fox, Giovanni Tapang, Caesar Saloma', 'Semiconductor laser optical feedback Mach-Zehnder interferometer', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PA-52', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.728051', '2020-01-08 02:33:39.728051', 51, 'spp', 'Hazel Glaine Labasan Sales, Giovanni Alarkon Tapang', 'Information flow in a dynamic weighted Erdös-Rényi network with different noise-enhanced node capacities', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-11', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.729053', '2020-01-08 02:33:39.729053', 52, 'spp', 'Jejomar Yape Derecho, May Tan Lim', 'Thematic trends in worldwide news reporting in the English language', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-15', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.729053', '2020-01-08 02:33:39.729053', 53, 'spp', 'Reinier Xander Azcueta Ramos, Johnrob Yap Bantang', 'Totalistic cellular automata model of a neuronal network on a spherical surface', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-16', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.730053', '2020-01-08 02:33:39.730053', 54, 'spp', 'Jamika Ann Estacio Roque, Giovanni A Tapang', 'Sub-millimeter wave transmission spectra of 2D polymer metamaterials using a Finite-Difference Time-Domain method', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-17', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.730053', '2020-01-08 02:33:39.730053', 55, 'spp', 'Hannah Christina Chan Arjonillo, Caesar Saloma', 'Curvature correction and Mie scattering in Monte Carlo analysis of propagating focused Gaussian beam in scattering media', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-20', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.731053', '2020-01-08 02:33:39.731053', 56, 'spp', 'Ivan M. Fenis, Damian N. Dailisan, May Lim', 'Interplay of behavior and traffic dynamics at U-turn slots', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-22', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.731053', '2020-01-08 02:33:39.731053', 57, 'spp', 'Jan Parvin Bat-og Zoluaga, Giovanni Tapang', 'Correlation dendrograms based on word adjacency co-occurrence language network parameters', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-26', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-08 02:33:39.732053', 58, 'spp', 'Kristen Joyce Rino Cervantes, Giovanni Alarkon Tapang', 'Information flow in random networks with varying effective node capacities', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-28', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-08 02:33:39.732053', 59, 'spp', 'Kenneth Modesto Leo, May Tan Lim', 'Assortativity and resiliency of a Brownian bug network', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-29', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.732053', '2020-01-08 02:33:39.732053', 60, 'spp', 'Sheenly Anne P. Saavedra, Johnrob Y. Bantang', 'Recurrence plot analysis of Internet access user activity', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-30', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.733052', '2020-01-08 02:33:39.733052', 61, 'spp', 'Samantha Ruth Centeno Lahoz, Johnrob Y. Bantang', 'Burst distributions in stochastic rate model of neuronal populations', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-31', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.733052', '2020-01-08 02:33:39.733052', 62, 'spp', 'Crizzia Mielle Mariano de Castro, May T. Lim', 'Determining senatorial voting archetypes through hyperspectral unmixing', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-32', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-08 02:33:39.734051', 63, 'spp', 'Kenneth V. Domingo, Maricor N. Soriano', 'Frequency domain reconstruction of stochastically sampled signals based on compressive sensing', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-38', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-08 02:33:39.734051', 64, 'spp', 'Cyd Kristoff Redelosa, May Lim', 'Traffic analysis zones-based resource allocation analysis using Uber Movement data', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-46', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.734051', '2020-01-08 02:33:39.734051', 65, 'spp', 'Carl Jesse Raz Naces, Wilfredo Licuanan, Maricor Narvaez Soriano', 'Comparison of shadow rugosity versus chain-tape rugosity values from 3D coral reef models', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-51', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:33:39.735051', '2020-01-08 02:33:39.735051', 66, 'spp', 'Creo Baylon, Maricor Soriano', 'Increasing Picavet stability by extending the off-string axis', 'Proceedings of the Samahang Pisika ng Pilipinas Physics Conference', 37, NULL, NULL, 2019, NULL, NULL, 'https://paperview.spp-online.org/proceedings/article/view/SPP-2019-PB-52', NULL, NULL);
INSERT INTO public.publications VALUES ('2020-01-08 02:51:05.766034', '2020-01-08 02:51:05.766034', 67, 'reg', 'RA Aguilar, NP Hermosa, and MN Soriano', 'Low-cost Fourier ghost imaging using a light-dependent resistor', 'American Journal of Physics', 87, 12, 12, 2019, NULL, NULL, 'https://aapt.scitation.org/doi/10.1119/10.0000163h5Q1NdpGjWVGA', '10.1119/10.0000163', 'Submitted by: Kenneth Domingo via /report-publication
Contact: kvdomingo@up.edu.ph.');


ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


ALTER TABLE ONLY public.publications
    ADD CONSTRAINT publications_pkey PRIMARY KEY (id);


CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.publications FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();
