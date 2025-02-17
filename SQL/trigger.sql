CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE OR REPLACE FUNCTION log_users()
RETURNS TRIGGER AS $$

BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO log_users (
		action_type, 
		user_uuid,
		old_user_name,
		old_user_password_hash,
		old_user_email,
		old_user_is_admin,
		changed_by,
		changed_at
	) VALUES (
		'DELETE',
		OLD.user_uuid,
		OLD.user_name,
		OLD.user_password_hash,
		OLD.user_email,
		OLD.user_is_admin,
		current_user,
		NOW()
	);
	RETURN OLD;
    ELSIF TG_OP = 'INSERT' THEN
	INSERT INTO log_users (
		action_type, 
		user_uuid,
		new_user_name,
		new_user_password_hash,
		new_user_email,
		new_user_is_admin,
		changed_by,
		changed_at
	) VALUES (
		'INSERT',
		NEW.user_uuid,
		NEW.user_name,
		NEW.user_password_hash,
		NEW.user_email,
		NEW.user_is_admin,
		current_user,
		NOW()
	);
	RETURN NEW;
    ELSE
	INSERT INTO log_users (
		action_type, 
		user_uuid,
		old_user_name,
		new_user_name,
		old_user_password_hash,
		new_user_password_hash,
		old_user_email,
		new_user_email,
		old_user_is_admin,
		new_user_is_admin,
		changed_by,
		changed_at
	) VALUES (
		'UPDATE',
		OLD.user_uuid,	
		OLD.user_name,
		NEW.user_name,
		OLD.user_password_hash,
		NEW.user_password_hash,
		OLD.user_email,
		NEW.user_email,
		OLD.user_is_admin,
		NEW.user_is_admin,
		current_user,
		NOW()
	);
	RETURN NEW;
    END IF;
END;

$$ LANGUAGE plpgsql;


CREATE TRIGGER log_users
AFTER INSERT OR UPDATE OR DELETE ON users
FOR EACH ROW
EXECUTE FUNCTION log_users();


INSERT INTO users (user_uuid, user_name, user_password_hash, user_email, created_at, updated_at) VALUES (uuid_generate_v4(), 'John117', 'abcdefg', 'john117@halo.com', NOW(), NOW());

INSERT INTO users (user_uuid, user_name, user_password_hash, user_email, created_at, updated_at) VALUES (uuid_generate_v4(), 'John118', 'abcdefgh', 'john118@halo.com', NOW(), NOW());

INSERT INTO users (user_uuid, user_name, user_password_hash, user_email, created_at, updated_at) VALUES (uuid_generate_v4(), 'John119', 'abcdefghi', 'john119@halo.com', NOW(), NOW());

UPDATE users SET user_email = 'john119@bungee.com' WHERE user_name = 'John119';

DELETE FROM users WHERE user_name = 'John119';

SELECT * FROM log_users;

