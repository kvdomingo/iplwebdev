CREATE TABLE regular (
    id SERIAL PRIMARY KEY NOT NULL,
    authors VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    journal VARCHAR NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,
    url VARCHAR,
    issue integer,
    page_start integer,
    page_end integer,
    date_inserted TIMESTAMPTZ DEFAULT now() NOT NULL,
    last_updated TIMESTAMPTZ DEFAULT now() NOT NULL,
    volume INTEGER
);


CREATE TABLE spp (
    id SERIAL PRIMARY KEY NOT NULL,
    authors VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    spp_code VARCHAR NOT NULL,
    year INTEGER NOT NULL
);


INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (3, 'C Saloma', 'Journal Status Report 2018', 'Philipp. J. Sci', '9', 2018, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no1/Editorial_for_Vol148_No1_Brain_Drain_and_Inbreeding_in_the_Training_of_Future_Filipino_Scientists.pdf', 3, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 147);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (1, 'HV Lee Jr, LMD Rosario, RB Tumlos, HJ Ramos, LMT Bo-Ot, and MN Soriano.', 'Excitation of O(1S) auroral green line from ambient air in a microwave-induced plasma jet at atmospheric pressure', 'Japanese Journal of Applied Physics', '6', 2018, 'https://doi.org/10.7567/JJAP.57.066102', 6, 66102, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 57);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (2, 'JAF Balista and CA Saloma', 'Modified inelastic bouncing ball model of the Brazil nut effect and its reverse', 'Granular Matter', '8', 2018, 'https://doi.org/10.1007/s10035-018-0821-2', 3, 47, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 20);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (4, 'MA Alagao, MA Go, MN Soriano, and GA Tapang', 'Characterization of the performance of a 7-mirror segmented reflecting telescope via the angular spectrum method', 'Springer Series in Optical Sciences', '10', 2018, 'https://doi.org/10.1007/978-3-319-98548-0_7', NULL, 137, 157, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 218);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (5, 'DN Dailisan and MT Lim', 'Vehicular traffic modeling with greedy lane-changing and inordinate waiting', 'Physica A', '5', 2019, 'https://doi.org/10.1016/j.physa.2019.01.107', NULL, 715, 723, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 521);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (6, 'AP Abella and MN Soriano', 'Detection and visualization of water surface three-wave resonance via a synthetic Schlieren method', 'Physica Scripta', '1', 2019, 'https://iopscience.iop.org/article/10.1088/1402-4896/aaf83a', 3, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 94);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (15, 'Rosario, L.M.D., Salapare, H.S., Guittard, F., Tumlos, R.B., Soriano, M.N.', 'Topological characterization of plasma-etched polymer surface using discontinuous percolation transition', 'Materials Chemistry and Physics', '10', 2017, 'https://doi.org/10.1016/j.matchemphys.2017.07.084', NULL, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 200);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (9, 'C Saloma', 'Valuable Lessons from a Decade of ERDT and ASTHRDP Implementation', 'Philipp. J. Sci', '6', 2019, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no2/EDITORIAL_Valuable_lessons_from_a_decade_of_ERDT_and_ASTHRDP_.pdf', 2, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 148);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (10, 'C Saloma', 'Journal Status Report 2019', 'Philipp. J. Sci', '9', 2019, 'http://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol148no3/Editorial_Journal_Status_Report.pdf', 3, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 148);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (11, 'Rubio LJM, Dailisan DN, Osorio MJP, David CC, Lim MT', 'Modeling the residential distribution of enrolled students to assess boundary-induced disparities in public school access', 'PLoS ONE', '10', 2019, 'https://doi.org/10.1371/journal.pone.0222766', 10, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 14);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (7, 'C Saloma', 'Brain Drain and Inbreeding in the Training of Future Filipino Scientists', 'Philipp. J. Sci', '3', 2019, '', 1, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 148);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (12, 'C. Saloma', 'Access to Tertiary Education (Editorial)', 'Phil. J Sc', '12', 2017, 'https://drive.google.com/file/d/1PKtMZXy8IYtyNoC1ohhOiow_H0i_7l7N/view', 4, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 146);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (13, 'CDO Janer, D. Biton, and RC Batac', 'Incorporating space, time, and magnitude measures in a network characterization of earthquake events', 'Acta Geophysica', '11', 2017, 'https://doi.org/10.1007/s11600-017-0100-3', 6, 1153, 1166, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 65);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (14, 'Bruzon, D.A., Tiongson, J.K., Tapang, G., Martinez, I.S.', 'Electroreduction and solubility of CO2in methoxy- and nitrile-functionalized imidazolium (FAP) ionic liquids', 'Journal of Applied Electrochemistry', '11', 2017, 'https://doi.org/10.1007/s10800-017-1117-7', 11, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 47);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (16, 'C. Saloma', 'Journal Status Report', 'Phil. J Sc', '9', 2017, 'https://drive.google.com/file/d/1DCEM6dELWF1Jn151qvNqvGER4U2P39At/view', 3, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 146);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (21, 'Soriano, M.', 'Making sense of the sea on a shoestring: A review of cost-effective tools for coral reef visualization', 'AIP Conference Proceedings', '1', 2017, 'https://doi.org/10.1063/1.4996531', NULL, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 1871);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (17, 'AA Paguirigan Jr, MJG Angco, and JY Bantang', 'A fragmentation model of earthquake-like behavior in internet access activity', 'Int. J Mod. Phys. C', '6', 2017, 'DOI:10.1142/S0129183117500929', 7, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 28);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (18, 'C Saloma', 'Measuring the performance of our higher education institutions Part II', 'Editorial, Phil. J Sc', '6', 2017, 'https://drive.google.com/file/d/0B1UyokJX8r2KclMtVTJOc1dhVGs/view', 2, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 146);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (19, 'Batac, R.C., Paguirigan, A.A., Tarun, A.B., Longjas, A.G.', 'Sandpile-based model for capturing magnitude distributions and spatiotemporal clustering and separation in regional earthquakes', 'Nonlinear Processes in Geophysics', '4', 2017, 'https://doi.org/10.5194/npg-24-179-2017', 2, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 24);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (20, 'Villacorta, R.B., Roque, K.F.J., Tapang, G.A., Jacinto, S.D.', 'Plant extracts as natural photosensitizers in photodynamic therapy: in vitro activity against human mammary adenocarcinoma MCF-7 cells', 'Asian Pacific Journal of Tropical Biomedicine', '4', 2017, 'https://doi.org/10.1016/j.apjtb.2017.01.025', 4, NULL, NULL, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:25:58.809302+08', 7);
INSERT INTO regular (id, authors, title, journal, month, year, url, issue, page_start, page_end, date_inserted, last_updated, volume) VALUES (8, 'WDG Improso, G Tapang and C Saloma', 'Suppression of Zeroth-Order Diffraction in Phase-Only Spatial Light Modulator', 'Chapter 1, Optics, Photonics and Laser Technology 2017, Springer Series in Optical Sciences 222, P. Ribeiro et al.', '7', 2019, 'https://doi.org/10.1007/978-3-030-12692-6_1', NULL, 1, 30, '2020-01-03 19:52:40.071504+08', '2020-01-03 22:27:44.173954+08', NULL);


INSERT INTO spp (id, authors, title, spp_code, year) VALUES (1, 'Ronilo Del Rosario, Caesar Aya-ay Saloma', 'An effective way to locate a Jollibee or McDonald`s store in the National Capital Region', '1F-01', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (2, 'Ciara De Ocampo Janer, Johnrob Yap Bantang, Rene Cabahug Batac', 'Robustness of the recurrence network analysis method with respect to data loss', '1F-03', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (3, 'Maria Loraine Ramos Menorca, May Tan Lim', 'Simulating network formation through in-person interaction in a limited budget environment', '1F-04', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (4, 'Michelle Tedlos Cirunay, Rene Cabahug Batac, Maricor N Soriano', 'Invariant statistical property throughout the road network evolution of Manila', '1F-05', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (5, 'Richmond L. Crisostomo, Johnrob Yap Bantang', 'Sunlight allocation in an L-system tree model', '1F-06', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (6, 'Joseph Roel Jaro Mabajen, May T. Lim', 'Price characterization of import goods from Customs dataset', '1F-07', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (7, 'Damian Nale Dailisan, May Lim', 'Jamming transitions in a mixed traffic cellular automata model', '2F-03', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (8, 'Adrian Chester M. Balingit, Damian N. Dailisan, May T. Lim', 'Mesoscopic simulation of road networks with time biasing of signalized intersections', '2F-04', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (9, 'Rafael Alberto Madera Bagood, Junius Andre F. Balista, Caesar Saloma', 'Modified inelastic bouncing ball model of the segregation of binary granular mixture: Numerical simulation', '2F-05', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (10, 'Merimae Sendaydiego Villamayor, Rene Cabahug Batac, Johnrob Yap Bantang', 'Cooperation levels of iterated Prisoner`s dilemma game with punishing agents and strategy update processes', '2F-06', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (11, 'Charles Jason Diaz, May T. Lim', 'Urbanization and barangay convexity relationship analysis', '2F-07', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (12, 'Roland Albert Austria Romero, Giovanni Alarkon Tapang, Caesar Aya-ay Saloma', 'High accuracy Philippine landfall prediction of Pacific cyclones at their genesis using neural networks', '3F-01', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (13, 'Kelvin Balaoro Bartilad, Damian Dailisan, May Lim', 'Estimating pedestrian traffic using bike share data', '3F-02', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (14, 'Louie John M. Rubio, Damian N. Dailisan, Maria Jeriesa P. Osorio, Clarissa C. David, May T. Lim', 'Assessing public elementary school quality in the Philippines', '3F-03', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (15, 'John Paul Emmanuel Llenaresas Algodon, May Tan Lim', 'Interpolation reliability of Philippine rainfall measurements', '3F-05', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (16, 'Joshua Jesli Dublado Santiago, Caesar Aya-ay Saloma', 'Self-organized criticality in an hourglass', '3F-07', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (17, 'Rafael Christopher Tan Darilag, Alfred P. Abella, Maricor N. Soriano', 'Experimental simulation of eddy formation in Sibuyan and Bohol sea', '3D-06', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (19, 'Erick John Carlo D Solibet, Melvin John Fernandez Empizo, Maria Cecilia Moralde Angub, Raymund Curioso Veloz, Christopher Jude Tan Vergara, Horace Andrew Fernandez Husay, Kohei Yamanoi, Toshihiko Shimizu, Arnel Angud Salvador, Nobuhiko Sarukura, Armando Soriano Somintac', 'Structural properties of hydrothermal-grown ZnO nanostructures fabricated using different ZnAc concentrations', '1E-03', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (20, 'Mark Jeremy Gacias Narag, Maricor Soriano', 'False positives reveal relationships among impressionist painters', '1C-01', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (21, 'Adrielle Theresa DL. Cusi, Giovanni A. Tapang, Caesar A. Saloma', 'Measurement of apparent Brownian motion diffusion coefficient under finite spatial and temporal detector resolution', '1C-02', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (22, 'Ritz Ann P. Aguilar, Nathaniel Hermosa, Maricor N. Soriano', 'Low-cost Fourier ghost imaging using a photoresistor', '1C-03', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (23, 'Rhei Joven Genove Juan, Maricor Narvaez Soriano', 'Effect of downsampling on the quality and resolution of super-resolved images', '1C-05', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (24, 'Micholo Lanz Billones Medrana, Maricor Narvaez Soriano', 'Depth simulation of underwater images for data augmentation', '1C-06', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (25, 'Matthew Joseph Ribano Banaag, Johnrob Yap Bantang', 'Dynamics of a singular particle on a 1D oscillating floor', '2B-02', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (26, 'Archie Veloria, Gay Jane Perez, Giovanni Tapang, Josefino Comiso', 'From TRMM to GPM: verifying the continuity of satellite-derived rainfall through comparison with Philippine synoptic measurements', '3E-04', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (27, 'Paolo Rafael Deriquito Mawis, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Characterizing pixel crosstalk in a transmissive spatial light modulator', 'PA-47', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (28, 'Eric Joshua Vincent Capuloy Reyes, Wynn Dunn Gil Dugang Improso, Giovanni Alarkon Tapang', 'Point spread function robustness in galvanometer beam scanning', 'PA-51', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (29, 'Anthony Paul Noquillo Fox, Giovanni Tapang, Caesar Saloma', 'Semiconductor laser optical feedback Mach-Zehnder interferometer', 'PA-52', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (30, 'Hazel Glaine Labasan Sales, Giovanni Alarkon Tapang', 'Information flow in a dynamic weighted Erdös-Rényi network with different noise-enhanced node capacities', 'PB-11', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (31, 'Jejomar Yape Derecho, May Tan Lim', 'Thematic trends in worldwide news reporting in the English language', 'PB-15', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (32, 'Reinier Xander Azcueta Ramos, Johnrob Yap Bantang', 'Totalistic cellular automata model of a neuronal network on a spherical surface', 'PB-16', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (33, 'Jamika Ann Estacio Roque, Giovanni A Tapang', 'Sub-millimeter wave transmission spectra of 2D polymer metamaterials using a Finite-Difference Time-Domain method', 'PB-17', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (34, 'Hannah Christina Chan Arjonillo, Caesar Saloma', 'Curvature correction and Mie scattering in Monte Carlo analysis of propagating focused Gaussian beam in scattering media', 'PB-20', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (35, 'Ivan M. Fenis, Damian N. Dailisan, May Lim', 'Interplay of behavior and traffic dynamics at U-turn slots', 'PB-22', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (36, 'Jan Parvin Bat-og Zoluaga, Giovanni Tapang', 'Correlation dendrograms based on word adjacency co-occurrence language network parameters', 'PB-26', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (37, 'Kristen Joyce Rino Cervantes, Giovanni Alarkon Tapang', 'Information flow in random networks with varying effective node capacities', 'PB-28', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (38, 'Kenneth Modesto Leo, May Tan Lim', 'Assortativity and resiliency of a Brownian bug network', 'PB-29', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (39, 'Sheenly Anne P. Saavedra, Johnrob Y. Bantang', 'Recurrence plot analysis of Internet access user activity', 'PB-30', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (40, 'Samantha Ruth Centeno Lahoz, Johnrob Y. Bantang', 'Burst distributions in stochastic rate model of neuronal populations', 'PB-31', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (41, 'Crizzia Mielle Mariano de Castro, May T. Lim', 'Determining senatorial voting archetypes through hyperspectral unmixing', 'PB-32', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (42, 'Kenneth V. Domingo, Maricor N. Soriano', 'Frequency domain reconstruction of stochastically sampled signals based on compressive sensing', 'PB-38', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (43, 'Cyd Kristoff Redelosa, May Lim', 'Traffic analysis zones-based resource allocation analysis using Uber Movement data', 'PB-46', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (44, 'Carl Jesse Raz Naces, Wilfredo Licuanan, Maricor Narvaez Soriano', 'Comparison of shadow rugosity versus chain-tape rugosity values from 3D coral reef models', 'PB-51', 2019);
INSERT INTO spp (id, authors, title, spp_code, year) VALUES (45, 'Creo Baylon, Maricor Soriano', 'Increasing Picavet stability by extending the off-string axis', 'PB-52', 2019);


CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
	NEW.last_updated = NOW();
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER set_timestamp BEFORE UPDATE ON regular FOR EACH ROW EXECUTE FUNCTION trigger_set_timestamp();
