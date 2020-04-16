const firebaseConfig = {
  apiKey: 'YourApiKey',
  authDomain: '[YOUR_PROJECT].firebaseapp.com',
  databaseURL: 'https://[YOUR_PROJECT].firebaseio.com',
  projectId: '[YOUR_PROJECT]',
  storageBucket: '[YOUR_PROJECT].appspot.com',
  messagingSenderId: '...',
  appId: '1:...:web:...',
  measurementId: 'G-...'
}
firebase.initializeApp(firebaseConfig)
firebase.analytics()
