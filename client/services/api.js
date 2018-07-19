import { create } from 'apisauce';

const api = create({
  baseURL: 'http://192.168.99.106:4000/api',
  headers: {
        'Content-Type': 'application/json'
      },
});

export default api;
