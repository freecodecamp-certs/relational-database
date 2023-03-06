--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    distance_light_years integer,
    constellation character varying(20),
    source_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    discovered_by character varying(50),
    discovery_year integer,
    planet_id integer NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_known_life boolean NOT NULL,
    type text,
    details text,
    distance numeric,
    distance_units character varying(20),
    discovery_year integer,
    star_id integer NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: source; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.source (
    source_id integer NOT NULL,
    name character varying(30) NOT NULL,
    link text NOT NULL,
    is_list boolean,
    type character varying(10)
);


ALTER TABLE public.source OWNER TO freecodecamp;

--
-- Name: source_source_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.source_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_source_id_seq OWNER TO freecodecamp;

--
-- Name: source_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.source_source_id_seq OWNED BY public.source.source_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    radius_solar_radii numeric,
    distance_light_years numeric,
    constellation character varying(20),
    galaxy_id integer NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: source source_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.source ALTER COLUMN source_id SET DEFAULT nextval('public.source_source_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 25881, 'Sagittarius', 2);
INSERT INTO public.galaxy VALUES (2, 'largeMagellanicCloud', 'Magellanic spiral SB(s)m', 163000, 'Dorado/Mensa', 2);
INSERT INTO public.galaxy VALUES (3, 'smallMagellanicCloud', 'Magellanic spiral SB(s)m pec', 206000, 'Tucana/Hydrus', 2);
INSERT INTO public.galaxy VALUES (4, 'Messier 81 Bodes Galaxy', 'Grand Design Spiral SA(s)ab LINER', 11400000, 'Ursa Major', 2);
INSERT INTO public.galaxy VALUES (5, 'Messier 82 Cigar Galaxy', 'Starburst I0', 11900000, 'Ursa Major', 2);
INSERT INTO public.galaxy VALUES (6, 'NGC 2366', 'IB(s)m', 10000000, 'Camelopardalis', 2);
INSERT INTO public.galaxy VALUES (7, 'Leo A', 'IBm', 2600000, 'Leo', 2);
INSERT INTO public.galaxy VALUES (8, 'M49', 'Elliptical', 53600000, 'Virgo', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'unknown', 0, 3, 11);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Hall', 1877, 4, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Hall', 1877, 4, 11);
INSERT INTO public.moon VALUES (4, 'Io', 'Galileo', 1610, 5, 11);
INSERT INTO public.moon VALUES (5, 'Europa', 'Galileo', 1610, 5, 11);
INSERT INTO public.moon VALUES (6, 'Titan', 'Huygens', 1655, 6, 11);
INSERT INTO public.moon VALUES (7, 'Hyperion', 'W. Bond, G.Bond and Lassell', 1848, 6, 11);
INSERT INTO public.moon VALUES (8, 'Phoebe', 'Pickering', 1899, 6, 11);
INSERT INTO public.moon VALUES (9, 'Janus', 'Dolfus (Voyager 1)', 1966, 6, 11);
INSERT INTO public.moon VALUES (10, 'Atlas', 'Terile (Voyager 1)', 1980, 6, 11);
INSERT INTO public.moon VALUES (11, 'Prometheus', 'Collins (Voyager 1)', 1980, 6, 11);
INSERT INTO public.moon VALUES (12, 'Ariel', 'Lassell', 1851, 7, 11);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Herschel', 1787, 7, 11);
INSERT INTO public.moon VALUES (14, 'Portia', 'Synnott (Voyager 2)', 1986, 7, 11);
INSERT INTO public.moon VALUES (15, 'Caliban', 'Gladman, Nicholson, Burns and Kavelaars', 1997, 7, 11);
INSERT INTO public.moon VALUES (16, 'Triton', 'Lassell', 1949, 8, 11);
INSERT INTO public.moon VALUES (17, 'Nereid', 'Kuiper', 1949, 8, 11);
INSERT INTO public.moon VALUES (18, 'Naiad', 'Terrile (Voyager 2)', 1989, 8, 11);
INSERT INTO public.moon VALUES (19, 'Proteus', 'Synnott (Voyager 2)', 1989, 8, 11);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 'Showalter et al.', 2013, 8, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Terrestrial', 'The smallest planet in the solar system', 57909175, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Terrestrial', 'The hottest planet in the solar system (by surface temperature)', 108208930, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Terrestrial', 'Home-planet of humanity (among other life)', 149597890, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Terrestrial', 'The closest planet to earth', 227936640, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Gaseous', 'The largest planet in the solar system', 778412010, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Gaseous', 'Has 83 moons, and hundreds of moonlets within the rings', 1426725400, 'Kilometers', 0, 1, 10);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'Gaseous', 'Methaneous', 2870972200, 'Kilometers', 1781, 1, 10);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'Gaseous', 'The most distant planet from the sun, Neptune has a pronounced gravitational impact on the Kuiper belt', 4498252900, 'Kilometers', 1846, 1, 10);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, 'Terrestrial', 'Potential for water', 4.37, 'Light years', 2016, 6, 6);
INSERT INTO public.planet VALUES (10, 'SWEEPS-04', false, 'Gaseous', 'Most distant known planet', 27710, 'Light years', 2006, 7, 7);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', false, 'Terrestrial', 'Orbits coldest known star', 40, 'Light years', 2017, 8, 9);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', false, 'Unknown', 'Estimated surface temp of 22C & orbits sun-like star', 600, 'Light years', 2011, 9, 6);


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.source VALUES (1, 'Sun', 'https://en.wikipedia.org/wiki/Sun', false, 'star');
INSERT INTO public.source VALUES (2, 'Messier Object', 'https://en.wikipedia.org/wiki/Messier_object', true, 'galaxy');
INSERT INTO public.source VALUES (3, 'Star List', 'https://en.wikipedia.org/wiki/List_of_largest_known_stars', true, 'star');
INSERT INTO public.source VALUES (4, 'Proxima Centauri', 'https://en.wikipedia.org/wiki/Proxima_Centauri', false, 'star');
INSERT INTO public.source VALUES (5, 'SWEEPS', 'https://en.wikipedia.org/wiki/SWEEPS_J175853.92%E2%88%92291120.6', false, 'star');
INSERT INTO public.source VALUES (6, 'Extra solar water', 'https://en.wikipedia.org/wiki/List_of_extrasolar_candidates_for_liquid_water', true, 'planet');
INSERT INTO public.source VALUES (7, 'SWEEPS-04', 'https://en.wikipedia.org/wiki/SWEEPS-04', false, 'planet');
INSERT INTO public.source VALUES (8, 'TRAPPIST-1', 'https://en.wikipedia.org/wiki/TRAPPIST-1', false, 'star');
INSERT INTO public.source VALUES (9, 'TRAPPIST-1e', 'https://en.wikipedia.org/wiki/TRAPPIST-1e', false, 'planet');
INSERT INTO public.source VALUES (10, 'Objects in the solar system', 'https://en.wikipedia.org/wiki/List_of_gravitationally_rounded_objects_of_the_Solar_System', true, 'planets');
INSERT INTO public.source VALUES (11, 'Natural satellites', 'https://en.wikipedia.org/wiki/List_of_natural_satellites', true, 'satellites');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'G-Type Main-Sequence', 1, 0.00001581256, 'Solar System', 1, 1);
INSERT INTO public.star VALUES (2, 'WOH G64', 'Red Supergiant', 1540, 160000, 'Dorado', 2, 3);
INSERT INTO public.star VALUES (3, 'HV888', 'Red Supergiant', 1232.5, 163079.9, 'Dorado', 2, 3);
INSERT INTO public.star VALUES (4, 'NGC 2363-V1', 'Luminous Blue variable', 275, 10800000, 'Camelopardalis', 6, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red Supergiant', 764, 8500000, 'Orion', 1, 3);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red Dwarf (M5.5)', 0.1542, 2.9, 'Centaurus', 1, 4);
INSERT INTO public.star VALUES (7, 'SWEEPS J175853.92−291120.6', 'F-type Main Sequence (F V)', 1.18, 27700, 'Sagittarius', 1, 7);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 'Ultra-cool red dwarf', 0.1192, 40.66, 'Aquarius', 1, 8);
INSERT INTO public.star VALUES (9, 'Kepler-22', 'G-type (G5V)', 0.979, 638, 'Cygnus', 1, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: source_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.source_source_id_seq', 11, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: source source_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_name_key UNIQUE (name);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (source_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- Name: planet planet_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_source_id_fkey FOREIGN KEY (source_id) REFERENCES public.source(source_id);


--
-- PostgreSQL database dump complete
--
