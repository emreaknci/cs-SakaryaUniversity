--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statuses (
    "Id" integer NOT NULL,
    "StatusName" character varying(50) NOT NULL
);


ALTER TABLE public.statuses OWNER TO postgres;

--
-- Name: Statues_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Statues_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Statues_Id_seq" OWNER TO postgres;

--
-- Name: Statues_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Statues_Id_seq" OWNED BY public.statuses."Id";


--
-- Name: statusChangeLogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."statusChangeLogs" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "Date" timestamp without time zone DEFAULT now() NOT NULL,
    "StatusId" integer NOT NULL
);


ALTER TABLE public."statusChangeLogs" OWNER TO postgres;

--
-- Name: statusChangeLogs_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."statusChangeLogs_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."statusChangeLogs_Id_seq" OWNER TO postgres;

--
-- Name: statusChangeLogs_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."statusChangeLogs_Id_seq" OWNED BY public."statusChangeLogs"."Id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "Id" integer NOT NULL,
    "UserName" character varying(50) NOT NULL,
    "Password" character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."users_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users_Id_seq" OWNER TO postgres;

--
-- Name: users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."users_Id_seq" OWNED BY public.users."Id";


--
-- Name: statusChangeLogs Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."statusChangeLogs" ALTER COLUMN "Id" SET DEFAULT nextval('public."statusChangeLogs_Id_seq"'::regclass);


--
-- Name: statuses Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses ALTER COLUMN "Id" SET DEFAULT nextval('public."Statues_Id_seq"'::regclass);


--
-- Name: users Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN "Id" SET DEFAULT nextval('public."users_Id_seq"'::regclass);


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.statuses VALUES
	(1, 'Acik'),
	(2, 'Kapali');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES
	(1, 'emreaknci', '123456'),
	(2, 'celalceken', '12345');


--
-- Name: Statues_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Statues_Id_seq"', 2, true);


--
-- Name: statusChangeLogs_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."statusChangeLogs_Id_seq"', 65, true);


--
-- Name: users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users_Id_seq"', 3, true);


--
-- Name: statuses Statues_StatusName_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT "Statues_StatusName_key" UNIQUE ("StatusName");


--
-- Name: statuses Statues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT "Statues_pkey" PRIMARY KEY ("Id");


--
-- Name: users UserIdPk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UserIdPk" PRIMARY KEY ("Id");


--
-- Name: statusChangeLogs statusChangeLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."statusChangeLogs"
    ADD CONSTRAINT "statusChangeLogs_pkey" PRIMARY KEY ("Id");


--
-- Name: users users_UserName_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_UserName_key" UNIQUE ("UserName");


--
-- Name: statusChangeLogs StatusId_Pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."statusChangeLogs"
    ADD CONSTRAINT "StatusId_Pk" FOREIGN KEY ("StatusId") REFERENCES public.statuses("Id");


--
-- Name: statusChangeLogs UserId_PK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."statusChangeLogs"
    ADD CONSTRAINT "UserId_PK" FOREIGN KEY ("UserId") REFERENCES public.users("Id");


--
-- PostgreSQL database dump complete
--

