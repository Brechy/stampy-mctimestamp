FROM node:20.3.0-alpine3.17

ENV PORT=5000

RUN mkdir /app
WORKDIR /app
COPY package.json /app/
COPY package-lock.json /app/
RUN npm install
COPY public /app/public
COPY views /app/views
COPY index.js /app/

ENTRYPOINT []
EXPOSE 5000
HEALTHCHECK --timeout=1s --interval=3s CMD ["curl", "-s", "http://localhost:5000"]
CMD ["npm", "start"]
