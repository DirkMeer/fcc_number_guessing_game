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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'SPONBYBOB', 0, 0);
INSERT INTO public.users VALUES (2, 'user_1661708369625', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1661708369624', 0, 0);
INSERT INTO public.users VALUES (4, 'user_1661708546494', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1661708546493', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1661708622852', 0, 0);
INSERT INTO public.users VALUES (7, 'user_1661708622851', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1661708700979', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1661708700978', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1661708846144', 0, 0);
INSERT INTO public.users VALUES (11, 'user_1661708846143', 0, 0);
INSERT INTO public.users VALUES (12, 'user_1661708966116', 0, 0);
INSERT INTO public.users VALUES (13, 'user_1661708966115', 0, 0);
INSERT INTO public.users VALUES (14, 'user_1661709750300', 0, 0);
INSERT INTO public.users VALUES (15, 'user_1661709750299', 0, 0);
INSERT INTO public.users VALUES (16, 'user_1661709826664', 0, 0);
INSERT INTO public.users VALUES (17, 'user_1661709826663', 0, 0);
INSERT INTO public.users VALUES (18, 'sponbybyb', 0, 0);
INSERT INTO public.users VALUES (19, 'blaat', 0, 0);
INSERT INTO public.users VALUES (20, 'user_1661710243287', 0, 0);
INSERT INTO public.users VALUES (21, 'user_1661710243286', 0, 0);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

