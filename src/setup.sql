-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- View all organizations
-- ========================================

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER REFERENCES public.organization(organization_id),
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);

SELECT * FROM projects;

-- BRIGHTFUTURE BUILDERS
INSERT INTO projects (organization_id, title, description, location, date) VALUES
(1, 'Community Center Renovation', 'Full structural upgrade of the old town hall into an energy-efficient community hub.', 'Downtown Community Center, Plaza Area', '2026-08-15'),
(1, 'Green Roof Installation', 'Building a sustainable, plant-covered eco-roof atop the public library to manage rainwater.', 'Public Library, 5th Avenue', '2026-09-22'),
(1, 'Eco-Friendly Park Benches', 'Constructing and installing 20 new benches made entirely from 100% recycled plastic.', 'Central Public Park', '2026-10-05'),
(1, 'Accessible Ramp Initiative', 'Adding wheelchair ramps and accessible pathways to older non-profit buildings in the city.', 'Westside Medical Clinic District', '2026-11-12'),
(1, 'Solar Panel Community Grid', 'Installing micro-solar grids on residential roofs to lower community energy expenses.', 'East Suburbs Residential Area', '2027-01-20');

-- GREENHARVEST GROWERS
INSERT INTO projects (organization_id, title, description, location, date) VALUES
(2, 'Urban Greenhouse Kickoff', 'Setting up our first climate-controlled community greenhouse for year-round vegetable growth.', 'Northside Urban Plot B', '2026-08-28'),
(2, 'Composting for Beginners', 'A weekend workshop teaching local families how to successfully turn food waste into rich soil.', 'Community Garden Main Shed', '2026-09-12'),
(2, 'School Vegetable Patches', 'Partnering with local elementary schools to build interactive educational vegetable gardens.', 'Lincoln Elementary School Yard', '2026-10-18'),
(2, 'Vertical Farming Workshop', 'Training youth volunteers in hydro-cultural and vertical farming techniques for tight spaces.', 'GreenHarvest Training Hub', '2026-11-04'),
(2, 'Seasonal Harvest Festival', 'A community market event celebrating local crops and distributing free fresh food baskets.', 'Southside Farmer’s Square', '2026-11-29');

-- 3. UNITYSERVE VOLUNTEERS
INSERT INTO projects (organization_id, title, description, location, date) VALUES
(3, 'Annual Food Drive', 'Coordinating a city-wide non-perishable food collection to stock winter food pantries.', 'UnityServe Main Warehouse', '2026-09-01'),
(3, 'Senior Tech Support Day', 'Pairing tech-savvy volunteers with senior citizens to teach them digital connectivity tools.', 'Sunset Retirement Village Lounge', '2026-09-19'),
(3, 'Neighborhood Clean-Up Blitz', 'Mobilizing 100 volunteers to clean up litter, paint over graffiti, and plant trees.', 'Riverbed District Pathways', '2026-10-10'),
(3, 'Winter Coat Drive', 'Collecting and distributing heavy winter coats, blankets, and gloves for shelters.', 'St. Jude Community Hall', '2026-11-15'),
(3, 'Holiday Toy Workshop', 'Sorting, wrapping, and delivering donated holiday gifts to families in need.', 'UnityServe Headquarters', '2026-12-18');

-- CATEGORIES ========================================
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO categories (name) VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

ALTER TABLE projects 
ADD COLUMN category_id INTEGER 
REFERENCES categories(category_id);

UPDATE projects SET category_id = 1 WHERE title IN (
    'Community Center Renovation',
    'Green Roof Installation',
    'Eco-Friendly Park Benches',
    'Solar Panel Community Grid',
    'Neighborhood Clean-Up Blitz'
);

UPDATE projects SET category_id = 2 WHERE title IN (
    'Composting for Beginners',
    'School Vegetable Patches',
    'Vertical Farming Workshop',
    'Senior Tech Support Day'
);

UPDATE projects SET category_id = 3 WHERE title IN (
    'Accessible Ramp Initiative',
    'Seasonal Harvest Festival',
    'Annual Food Drive',
    'Holiday Toy Workshop'
);

UPDATE projects SET category_id = 4 WHERE title IN (
    'Winter Coat Drive'
	'Urban Greenhouse Kickoff'
);

ALTER TABLE categories ADD COLUMN description TEXT;

UPDATE categories SET description = 'Projects focused on sustainability, conservation, and protecting natural resources.' WHERE name = 'Environmental';
UPDATE categories SET description = 'Opportunities to learn new skills, support schools, and promote lifelong learning.' WHERE name = 'Educational';
UPDATE categories SET description = 'Initiatives that strengthen neighborhoods through volunteer work and local support.' WHERE name = 'Community Service';
UPDATE categories SET description = 'Programs aimed at improving physical, mental, and emotional well-being.' WHERE name = 'Health and Wellness';

SELECT * FROM projects;