--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplinas (
    id_disciplina integer NOT NULL,
    nome character varying(15) NOT NULL,
    ementa text NOT NULL
);


ALTER TABLE public.disciplinas OWNER TO postgres;

--
-- Name: disciplinas_com_sigilo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.disciplinas_com_sigilo AS
 SELECT disciplinas.nome,
    disciplinas.ementa
   FROM public.disciplinas;


ALTER TABLE public.disciplinas_com_sigilo OWNER TO postgres;

--
-- Name: livros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livros (
    id_livro integer,
    nome character varying(15),
    autor character varying(40),
    sinopse character varying(500)
);


ALTER TABLE public.livros OWNER TO postgres;

--
-- Name: professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professores (
    id_professor integer NOT NULL,
    celular character varying(14),
    nome character varying(40),
    id_disciplina integer
);


ALTER TABLE public.professores OWNER TO postgres;

--
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplinas (id_disciplina, nome, ementa) FROM stdin;
1	Portugu├¬s	Literatura e Gram├ítica
2	Matem├ítica	├ülgebra e Geometria
3	F├¡sica	Cinem├ítica e Din├ómica
4	Biologia	Evolu├º├úo e Gen├®tica
5	Hist├│ria	A Era Contepor├ónea
6	Filosofia	O Estoicismo
7	Qu├¡mica	A Estrutura Molecular
8	Geografia	A Organiza├º├úo Geopol├¡tica
\.


--
-- Data for Name: livros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livros (id_livro, nome, autor, sinopse) FROM stdin;
\.


--
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professores (id_professor, celular, nome, id_disciplina) FROM stdin;
\.


--
-- Name: disciplinas disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT disciplinas_pkey PRIMARY KEY (id_disciplina);


--
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id_professor);


--
-- Name: idx_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nome ON public.disciplinas USING btree (nome);


--
-- Name: professores professores_id_disciplina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES public.disciplinas(id_disciplina);


--
-- PostgreSQL database dump complete
--

