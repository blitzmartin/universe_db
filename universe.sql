--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    num_stars integer NOT NULL,
    years_in_mil integer,
    has_earth boolean
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
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    galaxy_planet_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    mineral text,
    years_in_mil integer,
    planet_id integer NOT NULL
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
    name character varying(30),
    num_moons integer,
    has_moon boolean,
    orbit numeric,
    years_in_mil integer,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    num_planets integer,
    status character varying(30),
    years_in_mil integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 30740, 70, true);
INSERT INTO public.galaxy VALUES (3, 'Pippo', 8709370, 230, false);
INSERT INTO public.galaxy VALUES (4, 'Topolino', 234, 40, false);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 44, 6, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 89, 435, false);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 924856128, 279, false);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES (1, 1, 2, 'First');
INSERT INTO public.galaxy_planet VALUES (2, 44, 6, 'Second');
INSERT INTO public.galaxy_planet VALUES (3, 49, 3, 'Third');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 'Silicate', 5, 1);
INSERT INTO public.moon VALUES (23, 'Moon', 'Carbon', 0, 1);
INSERT INTO public.moon VALUES (25, 'Photos', 'Carbon', 0, 1);
INSERT INTO public.moon VALUES (26, 'Deimos', 'Ice', 0, 1);
INSERT INTO public.moon VALUES (27, 'Europa', 'Ice', 0, 1);
INSERT INTO public.moon VALUES (28, 'Ganymede', 'Helium', 0, 1);
INSERT INTO public.moon VALUES (29, 'Callisto', 'Water', 1, 1);
INSERT INTO public.moon VALUES (30, 'Titan', 'Steel', 7, 1);
INSERT INTO public.moon VALUES (31, 'Ego', 'Jelly', 0, 1);
INSERT INTO public.moon VALUES (32, 'Triton', 'Carbon', 1, 1);
INSERT INTO public.moon VALUES (33, 'Ariel', 'Water', 4, 1);
INSERT INTO public.moon VALUES (34, 'Miranda', 'Silicate', 1, 1);
INSERT INTO public.moon VALUES (35, 'Rhea', 'Ice', 0, 1);
INSERT INTO public.moon VALUES (36, 'Tethys', 'Ice', 1, 1);
INSERT INTO public.moon VALUES (37, 'Dione', 'Iron', 0, 1);
INSERT INTO public.moon VALUES (38, 'Umbriel', 'Iron', 1, 1);
INSERT INTO public.moon VALUES (39, 'Charon', 'Ice', 0, 1);
INSERT INTO public.moon VALUES (40, 'Iapetus', 'Water', 5, 1);
INSERT INTO public.moon VALUES (41, 'Proteus', 'Hydrogen', 1, 1);
INSERT INTO public.moon VALUES (42, 'Nereid', 'Helium', 0, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 4.6, 30, 2, 1);
INSERT INTO public.planet VALUES (50, 'Toxic', 0, false, 0.24, 20, 3, 4);
INSERT INTO public.planet VALUES (51, 'Bell', 0, false, 4, 11, 2, 2);
INSERT INTO public.planet VALUES (52, 'Fox', 0, false, 3, 1, 2, 2);
INSERT INTO public.planet VALUES (41, 'Mars', 2, true, 1.5, 25, 2, 1);
INSERT INTO public.planet VALUES (42, 'Venus', 0, false, 0.7, 40, 2, 1);
INSERT INTO public.planet VALUES (43, 'Jupiter', 79, true, 11.9, 300, 2, 1);
INSERT INTO public.planet VALUES (44, 'Saturn', 82, true, 29.5, 250, 2, 1);
INSERT INTO public.planet VALUES (45, 'Uranus', 27, true, 84.0, 200, 2, 1);
INSERT INTO public.planet VALUES (46, 'Neptune', 14, true, 164.8, 160, 2, 1);
INSERT INTO public.planet VALUES (47, 'Mercury', 0, false, 0.24, 20, 2, 1);
INSERT INTO public.planet VALUES (49, 'Proxima Centauri b', 0, false, 11.2, 4, 2, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 45, 'Gas', 470, 2);
INSERT INTO public.star VALUES (2, 'Vega', 844, 'Liquid', 236, 2);
INSERT INTO public.star VALUES (3, 'Polaris', 43459, 'Solid', 521, 7);
INSERT INTO public.star VALUES (4, 'Rigel', 924856128, 'Gas', 279, 5);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 7809, 'Gas', 954, 2);
INSERT INTO public.star VALUES (6, 'Aldebaran', 123555, 'Liquid', 890, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 52, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_galaxy_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_galaxy_planet_id_key UNIQUE (galaxy_planet_id);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy_planet galaxy_planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

