Kitravia is a travel search platform that helps users search for flights and hotels through a simple web interface. The project includes flight search, hotel search, and bookmark features.

The frontend is built using HTML, CSS, and JavaScript. The backend uses Node.js and Express. Flight data is requested using the Amadeus API, while hotel data is requested using SerpApi.

Features

Users can search for one-way or round-trip flights, filter results by stops, airline, and price, compare flight offers, and save selected flights as bookmarks.

Users can also search for hotels by destination, check-in date, check-out date, and number of guests. Hotel results show basic details such as price, rating, reviews, amenities, and images.

The bookmark page allows users to view saved travel options, add notes, and remove saved items.

Users can also compare selected flight offers side by side to help choose the best option based on price, stops, airline, and route details.

Setup

Install dependencies:

npm install

Create a .env file:

AMADEUS_CLIENT_ID=your_client_id
AMADEUS_CLIENT_SECRET=your_client_secret
SERPAPI_KEY=your_serpapi_key

Run the project:

node server.js

Open the project at:

http://localhost:3000
Project Files
index.html        Flight search page
hotel.html        Hotel search page
bookmarks.html    Saved bookmarks page
server.js         Backend server and API routes
logo.jpg          Kitravia logo
README.md         Project information
