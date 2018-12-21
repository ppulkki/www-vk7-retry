# Ladataan node.js-alpine image tuotantokäyttöön
FROM node:alpine

# Mountataan lokaali /myapp kontainerin käyttöön
# sovelluskoodi ajetaan tämän alta
WORKDIR /home/node/express-locallibrary-tutorial

# Kopioidaan noden vaatima package.json kontainerin työhakemistoon 
COPY ./express-locallibrary-tutorial/package.json ./

# Suoritetaan tekemämme sovellus package.json ohjeen mukaan
RUN npm install

# kopioidaan loput sovelluksen vaatimat resurssitiedostot sovelluskansioon
copy ./express-locallibrary-tutorial .

# vinkataan portin 3000 olevan se mikä halutaan auki
expose 3000

# suoritetaan node.js sovelluksemmee kontainerin sisällä
CMD ["npm", "start"]


