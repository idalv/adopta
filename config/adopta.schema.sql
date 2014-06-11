
    create table assessment_rank (
        id bigint not null auto_increment,
        course_portfolio_id bigint,
        rank_from float not null,
        rank_to float not null,
        primary key (id)
    );

    create table assessment_rank_to_complexity (
        assessment_rank_id bigint not null,
        complexity_id bigint not null,
        primary key (assessment_rank_id, complexity_id)
    );

    create table complexity (
        id bigint not null auto_increment,
        description varchar(255),
        level integer not null,
        primary key (id)
    );

    create table course (
        id bigint not null auto_increment,
        name varchar(20) not null,
        primary key (id)
    );

    create table course_portfolio (
        id bigint not null auto_increment,
        add_visited_paths bit,
        authomatic_path_selection bit,
        number_of_questions integer,
        show_all_learning_objects bit,
        course_id bigint,
        user_id bigint,
        primary key (id)
    );

    create table learner_course_portfolio (
        id bigint not null auto_increment,
        course_id bigint,
        user_id bigint,
        primary key (id)
    );

    create table learning_object (
        id bigint not null auto_increment,
        name varchar(20) not null,
        ontology_id bigint,
        complexity_id bigint,
        status_id bigint,
        learning_object_subtype_id bigint,
        learning_object_type_id bigint,
        primary key (id)
    );

    create table learning_object_link_type (
        id bigint not null auto_increment,
        name varchar(20) not null,
        primary key (id)
    );

    create table learning_object_question_answer (
        id bigint not null auto_increment,
        learning_object_id bigint,
        points float,
        text varchar(255) not null,
        primary key (id)
    );

    create table learning_object_resource (
        id bigint not null auto_increment,
        blob_type varchar(20),
        learning_object_id bigint,
        resource_order integer,
        resource longblob,
        resource_type_id bigint,
        primary key (id)
    );

    create table learning_object_subtype (
        id bigint not null auto_increment,
        name varchar(20),
        type_id bigint,
        primary key (id)
    );

    create table learning_object_type (
        id bigint not null auto_increment,
        name varchar(64) not null,
        primary key (id)
    );

    create table lo_to_lo_link (
        id bigint not null auto_increment,
        label varchar(20),
        child_learning_object_id bigint,
        parent_learning_oject_id bigint,
        lom_parent bit,
        type_id bigint,
        primary key (id)
    );

    create table lom (
        id bigint not null auto_increment,
        learning_object_id bigint,
        value varchar(255),
        lom_definition_id bigint,
        primary key (id)
    );

    create table lom_definition (
        id bigint not null auto_increment,
        name varchar(255) not null,
        type varchar(20),
        primary key (id)
    );

    create table lom_predefined_value (
        id bigint not null auto_increment,
        lom_definition_id bigint,
        value varchar(255) not null,
        primary key (id)
    );

    create table ontology (
        id bigint not null auto_increment,
        name varchar(20) not null,
        user_id bigint,
        primary key (id)
    );

    create table ontology_metadata (
        id bigint not null auto_increment,
        ontology_id bigint,
        value varchar(255),
        definition_id bigint,
        primary key (id)
    );

    create table ontology_metadata_definition (
        id bigint not null auto_increment,
        name varchar(255) not null,
        type varchar(20),
        primary key (id)
    );

    create table ontology_metadata_predefined_value (
        id bigint not null auto_increment,
        ontology_metadata_definition_id bigint,
        value varchar(255) not null,
        primary key (id)
    );

    create table page (
        id bigint not null auto_increment,
        threshold float,
        title varchar(20) not null,
        x integer,
        y integer,
        course_id bigint,
        status_id bigint,
        page_type_id bigint,
        primary key (id)
    );

    create table page_to_learning_object (
        id bigint not null auto_increment,
        page_id bigint,
        position integer not null,
        learning_object_id bigint,
        primary key (id)
    );

    create table page_to_page_link (
        id bigint not null auto_increment,
        annotation varchar(64),
        label varchar(64) not null,
        next_page_id bigint,
        previous_page_id bigint,
        primary key (id)
    );

    create table page_type (
        id bigint not null auto_increment,
        name varchar(20) not null,
        primary key (id)
    );

    create table resource_type (
        id bigint not null auto_increment,
        name varchar(20) not null,
        primary key (id)
    );

    create table role (
        id bigint not null auto_increment,
        description varchar(255),
        name varchar(20) not null,
        primary key (id)
    );

    create table status (
        id bigint not null auto_increment,
        name varchar(20) not null,
        primary key (id)
    );

    create table style (
        id bigint not null auto_increment,
        name varchar(20),
        primary key (id)
    );

    create table style_to_user (
        id bigint not null auto_increment,
        percentage float,
        user_id bigint,
        style_id bigint,
        primary key (id)
    );

    create table user (
        id bigint not null auto_increment,
        password varchar(20) not null,
        username varchar(20) not null,
        status_id bigint,
        primary key (id)
    );

    create table user_to_role (
        user_id bigint not null,
        role_id bigint not null,
        primary key (user_id, role_id)
    );

    create table visited_page (
        id bigint not null auto_increment,
        learner_portfolio_id bigint,
        visited_path_id bigint,
        visiting_order integer,
        page_id bigint,
        selected_path_id bigint,
        primary key (id)
    );

    create table visited_page_to_lo (
        id bigint not null auto_increment,
        position integer not null,
        visited_page_id bigint,
        learning_object_id bigint,
        primary key (id)
    );

    create table visted_path (
        id bigint not null auto_increment,
        comment varchar(255),
        learner_portfolio_id bigint,
        path_id bigint,
        satisfaction float,
        score float,
        visiting_order integer,
        primary key (id)
    );

    create table working_path (
        id bigint not null auto_increment,
        name varchar(255),
        course_id bigint,
        primary key (id)
    );

    create table working_path_to_page (
        id bigint not null auto_increment,
        page_index integer,
        working_path_id bigint,
        page_id bigint,
        primary key (id)
    );

    create table working_path_to_style (
        id bigint not null auto_increment,
        weight float,
        working_path_id bigint,
        style_id bigint,
        primary key (id)
    );

    alter table assessment_rank 
        add index FKF3BAB78946C78488 (course_portfolio_id), 
        add constraint FKF3BAB78946C78488 
        foreign key (course_portfolio_id) 
        references course_portfolio (id);

    alter table assessment_rank_to_complexity 
        add index FK30EBD80CC3D7D6FA (assessment_rank_id), 
        add constraint FK30EBD80CC3D7D6FA 
        foreign key (assessment_rank_id) 
        references assessment_rank (id);

    alter table assessment_rank_to_complexity 
        add index FK30EBD80CD8DE1DD5 (complexity_id), 
        add constraint FK30EBD80CD8DE1DD5 
        foreign key (complexity_id) 
        references complexity (id);

    alter table course_portfolio 
        add index FKBF67BA24875EAEF5 (user_id), 
        add constraint FKBF67BA24875EAEF5 
        foreign key (user_id) 
        references user (id);

    alter table course_portfolio 
        add index FKBF67BA244EADB235 (course_id), 
        add constraint FKBF67BA244EADB235 
        foreign key (course_id) 
        references course (id);

    alter table learner_course_portfolio 
        add index FKE2D42B2875EAEF5 (user_id), 
        add constraint FKE2D42B2875EAEF5 
        foreign key (user_id) 
        references user (id);

    alter table learner_course_portfolio 
        add index FKE2D42B24EADB235 (course_id), 
        add constraint FKE2D42B24EADB235 
        foreign key (course_id) 
        references course (id);

    alter table learning_object 
        add index FKE3A80F80FE31DF21 (learning_object_subtype_id), 
        add constraint FKE3A80F80FE31DF21 
        foreign key (learning_object_subtype_id) 
        references learning_object_subtype (id);

    alter table learning_object 
        add index FKE3A80F80DB938AF5 (ontology_id), 
        add constraint FKE3A80F80DB938AF5 
        foreign key (ontology_id) 
        references ontology (id);

    alter table learning_object 
        add index FKE3A80F80D8DE1DD5 (complexity_id), 
        add constraint FKE3A80F80D8DE1DD5 
        foreign key (complexity_id) 
        references complexity (id);

    alter table learning_object 
        add index FKE3A80F8097750ED5 (status_id), 
        add constraint FKE3A80F8097750ED5 
        foreign key (status_id) 
        references status (id);

    alter table learning_object 
        add index FKE3A80F8090E5D133 (learning_object_type_id), 
        add constraint FKE3A80F8090E5D133 
        foreign key (learning_object_type_id) 
        references learning_object_type (id);

    alter table learning_object_question_answer 
        add index FKE7D8577812FD5592 (learning_object_id), 
        add constraint FKE7D8577812FD5592 
        foreign key (learning_object_id) 
        references learning_object (id);

    alter table learning_object_resource 
        add index FK1CC255ED12FD5592 (learning_object_id), 
        add constraint FK1CC255ED12FD5592 
        foreign key (learning_object_id) 
        references learning_object (id);

    alter table learning_object_resource 
        add index FK1CC255ED4BB2F792 (resource_type_id), 
        add constraint FK1CC255ED4BB2F792 
        foreign key (resource_type_id) 
        references resource_type (id);

    alter table learning_object_subtype 
        add index FKFD9F63BB23F59AF2 (type_id), 
        add constraint FKFD9F63BB23F59AF2 
        foreign key (type_id) 
        references learning_object_type (id);

    alter table lo_to_lo_link 
        add index FKD1A727AE91501703 (parent_learning_oject_id), 
        add constraint FKD1A727AE91501703 
        foreign key (parent_learning_oject_id) 
        references learning_object (id);

    alter table lo_to_lo_link 
        add index FKD1A727AEF690F995 (child_learning_object_id), 
        add constraint FKD1A727AEF690F995 
        foreign key (child_learning_object_id) 
        references learning_object (id);

    alter table lo_to_lo_link 
        add index FKD1A727AEC37AB60C (type_id), 
        add constraint FKD1A727AEC37AB60C 
        foreign key (type_id) 
        references learning_object_link_type (id);

    alter table lom 
        add index FK1A34A12FD5592 (learning_object_id), 
        add constraint FK1A34A12FD5592 
        foreign key (learning_object_id) 
        references learning_object (id);

    alter table lom 
        add index FK1A34A206818D4 (lom_definition_id), 
        add constraint FK1A34A206818D4 
        foreign key (lom_definition_id) 
        references lom_definition (id);

    alter table lom_predefined_value 
        add index FK13CE524D206818D4 (lom_definition_id), 
        add constraint FK13CE524D206818D4 
        foreign key (lom_definition_id) 
        references lom_definition (id);

    alter table ontology 
        add index FK91D1094F875EAEF5 (user_id), 
        add constraint FK91D1094F875EAEF5 
        foreign key (user_id) 
        references user (id);

    alter table ontology_metadata 
        add index FKCB85AC1FF04063F3 (definition_id), 
        add constraint FKCB85AC1FF04063F3 
        foreign key (definition_id) 
        references ontology_metadata_definition (id);

    alter table ontology_metadata 
        add index FKCB85AC1FDB938AF5 (ontology_id), 
        add constraint FKCB85AC1FDB938AF5 
        foreign key (ontology_id) 
        references ontology (id);

    alter table ontology_metadata_predefined_value 
        add index FK5D3C6E18CD48BFD3 (ontology_metadata_definition_id), 
        add constraint FK5D3C6E18CD48BFD3 
        foreign key (ontology_metadata_definition_id) 
        references ontology_metadata_definition (id);

    alter table page 
        add index FK34628F97750ED5 (status_id), 
        add constraint FK34628F97750ED5 
        foreign key (status_id) 
        references status (id);

    alter table page 
        add index FK34628F92D44094 (page_type_id), 
        add constraint FK34628F92D44094 
        foreign key (page_type_id) 
        references page_type (id);

    alter table page 
        add index FK34628F4EADB235 (course_id), 
        add constraint FK34628F4EADB235 
        foreign key (course_id) 
        references course (id);

    alter table page_to_learning_object 
        add index FKD988816C12FD5592 (learning_object_id), 
        add constraint FKD988816C12FD5592 
        foreign key (learning_object_id) 
        references learning_object (id);

    alter table page_to_learning_object 
        add index FKD988816C603C0875 (page_id), 
        add constraint FKD988816C603C0875 
        foreign key (page_id) 
        references page (id);

    alter table page_to_page_link 
        add index FK70929A96AACA9729 (next_page_id), 
        add constraint FK70929A96AACA9729 
        foreign key (next_page_id) 
        references page (id);

    alter table page_to_page_link 
        add index FK70929A96A48C832D (previous_page_id), 
        add constraint FK70929A96A48C832D 
        foreign key (previous_page_id) 
        references page (id);

    alter table style_to_user 
        add index FKD72CEE81EB4E965F (style_id), 
        add constraint FKD72CEE81EB4E965F 
        foreign key (style_id) 
        references style (id);

    alter table style_to_user 
        add index FKD72CEE81875EAEF5 (user_id), 
        add constraint FKD72CEE81875EAEF5 
        foreign key (user_id) 
        references user (id);

    alter table user 
        add index FK36EBCB97750ED5 (status_id), 
        add constraint FK36EBCB97750ED5 
        foreign key (status_id) 
        references status (id);

    alter table user_to_role 
        add index FK161C9746E233EB15 (role_id), 
        add constraint FK161C9746E233EB15 
        foreign key (role_id) 
        references role (id);

    alter table user_to_role 
        add index FK161C9746875EAEF5 (user_id), 
        add constraint FK161C9746875EAEF5 
        foreign key (user_id) 
        references user (id);

    alter table visited_page 
        add index FKCBB05284C2E8BC97 (learner_portfolio_id), 
        add constraint FKCBB05284C2E8BC97 
        foreign key (learner_portfolio_id) 
        references learner_course_portfolio (id);

    alter table visited_page 
        add index FKCBB052846E2C1C54 (visited_path_id), 
        add constraint FKCBB052846E2C1C54 
        foreign key (visited_path_id) 
        references visted_path (id);

    alter table visited_page 
        add index FKCBB052848B22774C (selected_path_id), 
        add constraint FKCBB052848B22774C 
        foreign key (selected_path_id) 
        references working_path (id);

    alter table visited_page 
        add index FKCBB05284603C0875 (page_id), 
        add constraint FKCBB05284603C0875 
        foreign key (page_id) 
        references page (id);

    alter table visited_page_to_lo 
        add index FKF614504C12FD5592 (learning_object_id), 
        add constraint FKF614504C12FD5592 
        foreign key (learning_object_id) 
        references learning_object (id);

    alter table visited_page_to_lo 
        add index FKF614504C6D738C14 (visited_page_id), 
        add constraint FKF614504C6D738C14 
        foreign key (visited_page_id) 
        references visited_page (id);

    alter table visted_path 
        add index FKF3918F1C2E8BC97 (learner_portfolio_id), 
        add constraint FKF3918F1C2E8BC97 
        foreign key (learner_portfolio_id) 
        references learner_course_portfolio (id);

    alter table working_path 
        add index FKEF8748734EADB235 (course_id), 
        add constraint FKEF8748734EADB235 
        foreign key (course_id) 
        references course (id);

    alter table working_path_to_page 
        add index FK9A38AE077565B9E2 (working_path_id), 
        add constraint FK9A38AE077565B9E2 
        foreign key (working_path_id) 
        references working_path (id);

    alter table working_path_to_page 
        add index FK9A38AE07603C0875 (page_id), 
        add constraint FK9A38AE07603C0875 
        foreign key (page_id) 
        references page (id);

    alter table working_path_to_style 
        add index FKAD104139EB4E965F (style_id), 
        add constraint FKAD104139EB4E965F 
        foreign key (style_id) 
        references style (id);

    alter table working_path_to_style 
        add index FKAD1041397565B9E2 (working_path_id), 
        add constraint FKAD1041397565B9E2 
        foreign key (working_path_id) 
        references working_path (id);
