DROP TABLE IF EXISTS events CASCADE;
CREATE TABLE IF NOT EXISTS events (
    -- Integer primary key for events
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    -- 'date' is a reserved word in some SQL dialects.
    -- Here I quoted it to make sure it is interpreted
    -- as a column name.
    "date" TIMESTAMP WITH TIME ZONE NOT NULL,
    -- The 'image_url' must be a URL ending in png, gif, jpg.
    image_url TEXT NOT NULL
        CHECK ( image_url ~* '^https?://.*\.(png|gif|jpg)$' ),
    "location" TEXT NOT NULL,
    -- Record the time at which this event was created
    created_at TIMESTAMP WITH TIME ZONE
        NOT NULL
        DEFAULT current_timestamp
);

DROP TABLE IF EXISTS attendees;
CREATE TABLE attendees (
  email text NOT NULL,
  event_id INTEGER REFERENCES events(id) NOT NULL,
  PRIMARY KEY (email,event_id)
);
