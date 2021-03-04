PGDMP                         y            fyyur    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16597    fyyur    DATABASE     i   CREATE DATABASE fyyur WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE fyyur;
                postgres    false            �            1259    16709    Artist    TABLE       CREATE TABLE public."Artist" (
    id integer NOT NULL,
    name character varying,
    city character varying(120),
    state character varying(120),
    phone character varying(120),
    image_link character varying(500),
    facebook_link character varying(120),
    seeking_venue boolean,
    website character varying(120),
    past_shows_count integer,
    upcoming_shows_count integer,
    seeking_description character varying(2000),
    address character varying(120),
    genres character varying(200)[]
);
    DROP TABLE public."Artist";
       public         heap    postgres    false            �            1259    16707    Artist_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Artist_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Artist_id_seq";
       public          postgres    false    203            �           0    0    Artist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Artist_id_seq" OWNED BY public."Artist".id;
          public          postgres    false    202            �            1259    16720    Show    TABLE     �   CREATE TABLE public."Show" (
    id integer NOT NULL,
    venue_id integer,
    artist_id integer,
    start_time timestamp without time zone,
    artist_image_link character varying(2000)
);
    DROP TABLE public."Show";
       public         heap    postgres    false            �            1259    16718    Show_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Show_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Show_id_seq";
       public          postgres    false    205            �           0    0    Show_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Show_id_seq" OWNED BY public."Show".id;
          public          postgres    false    204            �            1259    16693    Venue    TABLE       CREATE TABLE public."Venue" (
    id integer NOT NULL,
    name character varying,
    city character varying(120),
    state character varying(120),
    address character varying(120),
    phone character varying(120),
    image_link character varying(500),
    facebook_link character varying(120),
    website character varying(120),
    past_shows_count integer,
    upcoming_shows_count integer,
    seeking_description character varying(2000),
    seeking_talent boolean,
    genres character varying(200)[]
);
    DROP TABLE public."Venue";
       public         heap    postgres    false            �            1259    16691    Venue_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Venue_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Venue_id_seq";
       public          postgres    false    201            �           0    0    Venue_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Venue_id_seq" OWNED BY public."Venue".id;
          public          postgres    false    200            �            1259    16799    alembic_version    TABLE     X   CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);
 #   DROP TABLE public.alembic_version;
       public         heap    postgres    false            6           2604    16712 	   Artist id    DEFAULT     j   ALTER TABLE ONLY public."Artist" ALTER COLUMN id SET DEFAULT nextval('public."Artist_id_seq"'::regclass);
 :   ALTER TABLE public."Artist" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            7           2604    16723    Show id    DEFAULT     f   ALTER TABLE ONLY public."Show" ALTER COLUMN id SET DEFAULT nextval('public."Show_id_seq"'::regclass);
 8   ALTER TABLE public."Show" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            5           2604    16696    Venue id    DEFAULT     h   ALTER TABLE ONLY public."Venue" ALTER COLUMN id SET DEFAULT nextval('public."Venue_id_seq"'::regclass);
 9   ALTER TABLE public."Venue" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            �          0    16709    Artist 
   TABLE DATA           �   COPY public."Artist" (id, name, city, state, phone, image_link, facebook_link, seeking_venue, website, past_shows_count, upcoming_shows_count, seeking_description, address, genres) FROM stdin;
    public          postgres    false    203   #       �          0    16720    Show 
   TABLE DATA           X   COPY public."Show" (id, venue_id, artist_id, start_time, artist_image_link) FROM stdin;
    public          postgres    false    205   i%       �          0    16693    Venue 
   TABLE DATA           �   COPY public."Venue" (id, name, city, state, address, phone, image_link, facebook_link, website, past_shows_count, upcoming_shows_count, seeking_description, seeking_talent, genres) FROM stdin;
    public          postgres    false    201   �&       �          0    16799    alembic_version 
   TABLE DATA           6   COPY public.alembic_version (version_num) FROM stdin;
    public          postgres    false    206   F)       �           0    0    Artist_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Artist_id_seq"', 20, true);
          public          postgres    false    202            �           0    0    Show_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Show_id_seq"', 10, true);
          public          postgres    false    204            �           0    0    Venue_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Venue_id_seq"', 25, true);
          public          postgres    false    200            ;           2606    16717    Artist Artist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Artist"
    ADD CONSTRAINT "Artist_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Artist" DROP CONSTRAINT "Artist_pkey";
       public            postgres    false    203            =           2606    16725    Show Show_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_pkey";
       public            postgres    false    205            9           2606    16701    Venue Venue_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Venue"
    ADD CONSTRAINT "Venue_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Venue" DROP CONSTRAINT "Venue_pkey";
       public            postgres    false    201            ?           2606    16803 #   alembic_version alembic_version_pkc 
   CONSTRAINT     j   ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
 M   ALTER TABLE ONLY public.alembic_version DROP CONSTRAINT alembic_version_pkc;
       public            postgres    false    206            A           2606    16731    Show Show_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_artist_id_fkey" FOREIGN KEY (artist_id) REFERENCES public."Artist"(id);
 F   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_artist_id_fkey";
       public          postgres    false    203    2875    205            @           2606    16726    Show Show_venue_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public."Show"
    ADD CONSTRAINT "Show_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES public."Venue"(id);
 E   ALTER TABLE ONLY public."Show" DROP CONSTRAINT "Show_venue_id_fkey";
       public          postgres    false    2873    205    201            �   @  x��T�n�@}���o��Rɪ�]m�6j�(R^X�6�%���|}פM��U�D���3gf�9��eӣ����{��-��|W:�T��>����Q@(�*����dbj���#���0��I[Yg"xB	�%$����E9/?�um�i�$�!��)�z��O�Juqn��:ܜ�X-����[(7.���mǫ)�x|3��-�V��T�ά��o��O�I���4�p����F�>�4s䫡���9�Z�m�#�i��4zB	�S�vZ}���?#�!-��Gm<}�3
�S��q�ۘ�6<dP�&�H��H��r�/��.,��
]��f����vՄ'�RF�8��De,
-s�vYA��n�gH(��ʠ�I�*"��u�0u�i^{	��3x�@���S�dQ�H�I�b�#�#�fJ��%;L��=N)!��@imP���±��ę��rI��z��3�%�.:t`T��t���Žo�s6Uۆsk�y=i�N��7�u�,ʎ��ߧ=?��@K"���ٻqB$��d�����~��`��L�6�5��ֺwHu���ǂ���-�_+��g_��*�F�L��m      �      x����J�@���)��n�s���� 
"��r�M�f�11I�}{ӚM�������q.(P(A�N���+��T���~L�k�f���>�~��MTt��o�����#�ز�dU	̦P���o}��Ĉ"�ޗiuxl���:{{�/����҅�n�Һ�l
k?�����w� �Wj! �B/83����&b�l!��CSǺ�l��������3���%���i��9��vE[e�2x5.vN�����3܅��k�]~�PI:�N��9p�N7I��	���1D��c�0���K��� �����      �   �  x��U[O�0~v�}"���L������	4�ċ�8�k�i����i��6&�)%9��]��fL(	G\�f̄�@����|[ۇ��j��'4�n��(�h����4��h�u�_��/�\��\�.؆��#����aj��Z�x%�|�j��:�dQp�p{n�G� Х]|�uˁ`4���|��؇�T��%(�r�0tk��iq�C�q�55V�ݣ7�3C����:Y&�S�Ӑ8�����B������C��*�Pve5)VgBgҙ4��R�%����6]s!�<��G�x�����ok�TL��jM)��H8��qQ�đ�`1]�dF,y-�+����G��'Cq/�	߼-�ヂ]��>nN�y:d���B�3�B�I�d3�&I��&c�k��-eǸ'<����D��Eoc�(c�	���6�%�yk��[8���Bg��k�����G#���zi��0�s� %���z�ش?Ƿ4�4p���cY�D�Ô���?�fJ�o96=�:�{�ݾ�Cz�z��G�X6?g�HVZ���Y�vǳ2�4�8NC�PZЄ-cы�	�&��0�؎���D�m~�R6��bt����[��#[vf`���Ô6�F�e���j���q��>�W�i���V�Ƞ/��pU3���3+M?��L��Q���0|��      �      x������ � �     