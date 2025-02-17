CREATE TABLE "users"(
    "user_uuid" UUID NOT NULL,
    "user_name" VARCHAR(255) NOT NULL,
    "user_password_hash" TEXT NOT NULL,
    "user_email" VARCHAR(255) NOT NULL,
    "user_is_admin" BOOLEAN NOT NULL DEFAULT '0',
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("user_uuid");
ALTER TABLE
    "users" ADD CONSTRAINT "users_user_name_unique" UNIQUE("user_name");
ALTER TABLE
    "users" ADD CONSTRAINT "users_user_email_unique" UNIQUE("user_email");
CREATE TABLE "builds"(
    "build_uuid" UUID NOT NULL,
    "build_user_uuid" UUID NOT NULL,
    "build_ship_model" UUID NOT NULL,
    "build_name" VARCHAR(255) NOT NULL,
    "core_armor" VARCHAR(255) NOT NULL,
    "core_pwr_plant" VARCHAR(255) NOT NULL,
    "core_thrusters" VARCHAR(255) NOT NULL,
    "core_fsd" VARCHAR(255) NOT NULL,
    "core_life_support" VARCHAR(255) NOT NULL,
    "core_pwr_distributor" VARCHAR(255) NOT NULL,
    "core_fuel_tank" VARCHAR(255) NOT NULL,
    "optional_0" VARCHAR(255) NULL,
    "optional_1" VARCHAR(255) NULL,
    "optional_2" VARCHAR(255) NULL,
    "optional_3" VARCHAR(255) NULL,
    "optional_4" VARCHAR(255) NULL,
    "optional_5" VARCHAR(255) NULL,
    "optional_6" VARCHAR(255) NULL,
    "optional_7" VARCHAR(255) NULL,
    "optional_8" VARCHAR(255) NULL,
    "optional_9" VARCHAR(255) NULL,
    "optional_10" VARCHAR(255) NULL,
    "optional_11" VARCHAR(255) NULL,
    "optional_12" VARCHAR(255) NULL,
    "optional_13" VARCHAR(255) NULL,
    "optional_14" VARCHAR(255) NULL,
    "optional_15" VARCHAR(255) NULL,
    "hardpoint_0" VARCHAR(255) NULL,
    "hardpoint_1" VARCHAR(255) NULL,
    "hardpoint_2" VARCHAR(255) NULL,
    "hardpoint_3" VARCHAR(255) NULL,
    "hardpoint_4" VARCHAR(255) NULL,
    "hardpoint_5" VARCHAR(255) NULL,
    "hardpoint_6" VARCHAR(255) NULL,
    "hardpoint_7" VARCHAR(255) NULL,
    "hardpoint_8" VARCHAR(255) NULL,
    "hardpoint_9" VARCHAR(255) NULL,
    "utility_0" VARCHAR(255) NOT NULL,
    "utility_1" VARCHAR(255) NOT NULL,
    "utility_2" VARCHAR(255) NOT NULL,
    "utility_3" VARCHAR(255) NOT NULL,
    "utility_4" VARCHAR(255) NOT NULL,
    "utility_5" VARCHAR(255) NOT NULL,
    "utility_6" VARCHAR(255) NOT NULL,
    "utility_7" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "builds" ADD PRIMARY KEY("build_uuid");
CREATE TABLE "log_users"(
    "change_id" bigserial NOT NULL,
    "action_type" VARCHAR(255) NOT NULL,
    "user_uuid" UUID NOT NULL,
    "old_user_name" VARCHAR(255) NULL,
    "new_user_name" VARCHAR(255) NULL,
    "old_user_password_hash" TEXT NULL,
    "new_user_password_hash" TEXT NULL,
    "old_user_email" VARCHAR(255) NULL,
    "new_user_email" VARCHAR(255) NULL,
    "old_user_is_admin" BOOLEAN NULL,
    "new_user_is_admin" BOOLEAN NULL,
    "changed_by" UUID NOT NULL,
    "changed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "log_users" ADD PRIMARY KEY("change_id");
CREATE TABLE "messages"(
    "message_uuid" UUID NOT NULL,
    "sender_user_uuid" UUID NOT NULL,
    "recipient_user_uuid" UUID NOT NULL,
    "message_text" TEXT NOT NULL,
    "message_topic" VARCHAR(255) NOT NULL,
    "sent_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    "messages" ADD PRIMARY KEY("message_uuid");
CREATE TABLE "ship_size"(
    "ship_size_id" SMALLINT NOT NULL,
    "size" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "ship_size" ADD PRIMARY KEY("ship_size_id");
CREATE TABLE "ship_model"(
    "ship_model_uuid" UUID NOT NULL,
    "ship_model_name" VARCHAR(255) NOT NULL,
    "ship_size" SMALLINT NOT NULL,
    "core_armor" VARCHAR(255) NOT NULL,
    "core_pwr_plant" VARCHAR(255) NOT NULL,
    "core_thrusters" VARCHAR(255) NOT NULL,
    "core_fsd" VARCHAR(255) NOT NULL,
    "core_life_support" VARCHAR(255) NOT NULL,
    "core_pwr_distributor" VARCHAR(255) NOT NULL,
    "core_fuel_tank" VARCHAR(255) NOT NULL,
    "optional_0_maxsize" VARCHAR(255) NULL,
    "optional_1_maxsize" VARCHAR(255) NULL,
    "optional_2_maxsize" VARCHAR(255) NULL,
    "optional_3_maxsize" VARCHAR(255) NULL,
    "optional_4_maxsize" VARCHAR(255) NULL,
    "optional_5_maxsize" VARCHAR(255) NULL,
    "optional_6_maxsize" VARCHAR(255) NULL,
    "optional_7_maxsize" VARCHAR(255) NULL,
    "optional_8_maxsize" VARCHAR(255) NULL,
    "optional_9_maxsize" VARCHAR(255) NULL,
    "optional_10_maxsize" VARCHAR(255) NULL,
    "optional_11_maxsize" VARCHAR(255) NULL,
    "optional_12_maxsize" VARCHAR(255) NULL,
    "optional_13_maxsize" VARCHAR(255) NULL,
    "optional_14_maxsize" VARCHAR(255) NULL,
    "optional_15_maxsize" VARCHAR(255) NULL,
    "hardpoint_0_maxsize" VARCHAR(255) NULL,
    "hardpoint_1_maxsize" VARCHAR(255) NULL,
    "hardpoint_2_maxsize" VARCHAR(255) NULL,
    "hardpoint_3_maxsize" VARCHAR(255) NULL,
    "hardpoint_4_maxsize" VARCHAR(255) NULL,
    "hardpoint_5_maxsize" VARCHAR(255) NULL,
    "hardpoint_6_maxsize" VARCHAR(255) NULL,
    "hardpoint_7_maxsize" VARCHAR(255) NULL,
    "hardpoint_8_maxsize" VARCHAR(255) NULL,
    "hardpoint_9_maxsize" VARCHAR(255) NULL,
    "utility_0_init" BOOLEAN NULL,
    "utility_1_init" BOOLEAN NULL,
    "utility_2_init" BOOLEAN NULL,
    "utility_3_init" BOOLEAN NULL,
    "utility_4_init" BOOLEAN NULL,
    "utility_5_init" BOOLEAN NULL,
    "utility_6_init" BOOLEAN NULL,
    "utility_7_init" BOOLEAN NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "ship_model" ADD PRIMARY KEY("ship_model_uuid");
ALTER TABLE
    "ship_model" ADD CONSTRAINT "ship_model_ship_model_name_unique" UNIQUE("ship_model_name");
ALTER TABLE
    "log_users" ADD CONSTRAINT "log_users_user_uuid_foreign" FOREIGN KEY("user_uuid") REFERENCES "users"("user_uuid");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_recipient_user_uuid_foreign" FOREIGN KEY("recipient_user_uuid") REFERENCES "users"("user_uuid");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_sender_user_uuid_foreign" FOREIGN KEY("sender_user_uuid") REFERENCES "users"("user_uuid");
ALTER TABLE
    "ship_model" ADD CONSTRAINT "ship_model_ship_size_foreign" FOREIGN KEY("ship_size") REFERENCES "ship_size"("ship_size_id");
ALTER TABLE
    "log_users" ADD CONSTRAINT "log_users_changed_by_foreign" FOREIGN KEY("changed_by") REFERENCES "users"("user_uuid");
ALTER TABLE
    "builds" ADD CONSTRAINT "builds_build_user_uuid_foreign" FOREIGN KEY("build_user_uuid") REFERENCES "users"("user_uuid");
ALTER TABLE
    "builds" ADD CONSTRAINT "builds_build_ship_model_foreign" FOREIGN KEY("build_ship_model") REFERENCES "ship_model"("ship_model_uuid");