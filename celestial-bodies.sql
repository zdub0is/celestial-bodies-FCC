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
    name character varying NOT NULL,
    diameter_ly integer,
    constellation character varying,
    name_origin text,
    naked_eye boolean
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
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    year_discovered numeric(4,0)
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
    name character varying NOT NULL,
    orbital_period_days integer NOT NULL,
    radius_km integer,
    star_id integer
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
-- Name: stage; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stage (
    stage_id integer NOT NULL,
    name character varying NOT NULL,
    stage_info text NOT NULL
);


ALTER TABLE public.stage OWNER TO freecodecamp;

--
-- Name: stage_stage_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stage_stage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stage_stage_id_seq OWNER TO freecodecamp;

--
-- Name: stage_stage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stage_stage_id_seq OWNED BY public.stage.stage_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    stage_id integer NOT NULL,
    is_active boolean NOT NULL
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
-- Name: stage stage_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage ALTER COLUMN stage_id SET DEFAULT nextval('public.stage_stage_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400, 'Sagittarius', 'The appearance from Earth of the galaxy—a band of light', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 152000, 'Andromeda', 'Gets its name from the area of the sky in which it appears, the constellation of Andromeda.', true);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 96000, 'Ursa Major', 'Named for Johann Elert Bode who discovered this galaxy in 1774.', true);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 144300, 'Sculptor', 'Its visual appearance is similar to that of a spoked cartwheel.', false);
INSERT INTO public.galaxy VALUES (5, 'Peekaboo Galaxy', 1200, 'Hydra', 'Was hidden behind a relatively fast-moving foreground star and became observable when the star moved aside.', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 49000, 'Virgo', 'Similar in appearance to a sombrero.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1738, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11267, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198, 1789);
INSERT INTO public.moon VALUES (9, 'Dione', 6, 561, 1684);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 763, 1672);
INSERT INTO public.moon VALUES (11, 'Titan', 6, 2574, 1655);
INSERT INTO public.moon VALUES (12, 'Hyperion', 6, 135, 1848);
INSERT INTO public.moon VALUES (13, 'Phoebe', 6, 106, 1899);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 578, 1851);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 789, 1787);
INSERT INTO public.moon VALUES (16, 'Juliet', 7, 46, 1986);
INSERT INTO public.moon VALUES (17, 'Puck', 7, 81, 1985);
INSERT INTO public.moon VALUES (18, 'Francisco', 7, 11, 2001);
INSERT INTO public.moon VALUES (19, 'Cupid', 7, 9, 2003);
INSERT INTO public.moon VALUES (20, 'Galatea', 8, 88, 1989);
INSERT INTO public.moon VALUES (21, 'Larissa', 8, 97, 1981);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 88, 2440, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 225, 6052, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 365, 6378, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 687, 3396, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4332, 71492, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10759, 71492, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 30688, 25559, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 60182, 24764, 1);
INSERT INTO public.planet VALUES (9, 'Galileo', 15, NULL, 7);
INSERT INTO public.planet VALUES (10, 'Brahe', 44, NULL, 7);
INSERT INTO public.planet VALUES (11, 'Lipperhey', 4825, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Jansen', 1, NULL, 7);
INSERT INTO public.planet VALUES (13, 'Harriot', 262, NULL, 7);


--
-- Data for Name: stage; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stage VALUES (1, 'Giant Gas Cloud', 'Formed by the gravitational collapse of giant clouds of dust and gas called Nebulae.');
INSERT INTO public.stage VALUES (2, 'Protostar', 'The formative phase of a star.');
INSERT INTO public.stage VALUES (3, 'Main Sequence', 'The main life cycle of a star.');
INSERT INTO public.stage VALUES (4, 'Red Giant', 'The beginning of a small star''s death.');
INSERT INTO public.stage VALUES (5, 'White Dwarf', 'A mass of carbon and oxygen. Dense and Bright.');
INSERT INTO public.stage VALUES (6, 'Black Dwarf', 'Strictly theoretical.');
INSERT INTO public.stage VALUES (7, 'Red Supergiant', 'Swells and goes until iron is formed.');
INSERT INTO public.stage VALUES (8, 'Supernova', 'The death of a star, happens in seconds.');
INSERT INTO public.stage VALUES (9, 'Black Hole', 'Gravity so intense it ''eats'' other mass around it!');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 3, true);
INSERT INTO public.star VALUES (2, 'Kepler''s Supernova', 1, 8, false);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 5, true);
INSERT INTO public.star VALUES (4, 'Polaris', 1, 3, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 7, false);
INSERT INTO public.star VALUES (6, 'Gaia BH1', 1, 9, false);
INSERT INTO public.star VALUES (7, '55 Cancri', 1, 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: stage_stage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stage_stage_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: stage stage_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_pkey PRIMARY KEY (stage_id);


--
-- Name: stage stage_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stage
    ADD CONSTRAINT stage_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: star fk_galaxy_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_stage_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_stage_star FOREIGN KEY (stage_id) REFERENCES public.stage(stage_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

