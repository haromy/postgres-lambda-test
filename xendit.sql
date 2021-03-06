PGDMP     $    %            
    w            xendit %   10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)    12.0     \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    16385    xendit    DATABASE     p   CREATE DATABASE xendit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
    DROP DATABASE xendit;
                fariz    false            �            1259    16386    SequelizeMeta    TABLE     R   CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public            fariz    false            �            1259    16401    comment    TABLE       CREATE TABLE public.comment (
    id integer NOT NULL,
    "orgId" integer,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.comment;
       public            fariz    false            �            1259    16399    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public          fariz    false    200            `           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
          public          fariz    false    199            �            1259    16409    member    TABLE     �  CREATE TABLE public.member (
    id integer NOT NULL,
    "orgId" integer,
    name character varying(255),
    username character varying(255),
    "imageUri" character varying(255),
    "followingCount" integer,
    "followerCount" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone
);
    DROP TABLE public.member;
       public            fariz    false            �            1259    16407    member_id_seq    SEQUENCE     �   CREATE SEQUENCE public.member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.member_id_seq;
       public          fariz    false    202            a           0    0    member_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;
          public          fariz    false    201            �            1259    16393    org    TABLE     �   CREATE TABLE public.org (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.org;
       public            fariz    false            �            1259    16391 
   org_id_seq    SEQUENCE     �   CREATE SEQUENCE public.org_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.org_id_seq;
       public          fariz    false    198            b           0    0 
   org_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.org_id_seq OWNED BY public.org.id;
          public          fariz    false    197            �
           2604    16404 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          fariz    false    199    200    200            �
           2604    16412 	   member id    DEFAULT     f   ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);
 8   ALTER TABLE public.member ALTER COLUMN id DROP DEFAULT;
       public          fariz    false    202    201    202            �
           2604    16396    org id    DEFAULT     `   ALTER TABLE ONLY public.org ALTER COLUMN id SET DEFAULT nextval('public.org_id_seq'::regclass);
 5   ALTER TABLE public.org ALTER COLUMN id DROP DEFAULT;
       public          fariz    false    198    197    198            S          0    16386    SequelizeMeta 
   TABLE DATA           /   COPY public."SequelizeMeta" (name) FROM stdin;
    public          fariz    false    196   �       W          0    16401    comment 
   TABLE DATA           b   COPY public.comment (id, "orgId", description, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          fariz    false    200   �       Y          0    16409    member 
   TABLE DATA           �   COPY public.member (id, "orgId", name, username, "imageUri", "followingCount", "followerCount", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public          fariz    false    202   u       U          0    16393    org 
   TABLE DATA           A   COPY public.org (id, name, "createdAt", "updatedAt") FROM stdin;
    public          fariz    false    198          c           0    0    comment_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.comment_id_seq', 5, true);
          public          fariz    false    199            d           0    0    member_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.member_id_seq', 4, true);
          public          fariz    false    201            e           0    0 
   org_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.org_id_seq', 1, true);
          public          fariz    false    197            �
           2606    16390     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public            fariz    false    196            �
           2606    16406    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            fariz    false    200            �
           2606    16417    member member_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pkey;
       public            fariz    false    202            �
           2606    16398    org org_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.org
    ADD CONSTRAINT org_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.org DROP CONSTRAINT org_pkey;
       public            fariz    false    198            S   <   x�320�4406443600�M.JM,I��/J��*���ssS�J�DrSs�R�@1z\\\ ֠h      W   �   x���!�0�a���C!Ț����:�`�3,Ќ��5�~� Y@`j�7y>*�8�a��T��$,��*�֑�u]��'*� 7��3�YlJ��x�����y��_'~B��� W��ฃ���唖;��'����_��#�V�������j�R�3�f�      Y   �   x���1
�0��Y>��[�d��9A�&�%$��k��`24��A�>����=n�����`��~N��b���0_�;I�=�#PoP�O_�\%�Ү-q���W��$|A�J��Җ|޺ �F)��f�      U   3   x�3�H�K�,�420��54�56T04�2��2�г4��60�#����� A�     