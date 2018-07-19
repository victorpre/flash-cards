import React from 'react';
import { StyleSheet, Text, View, AsyncStorage } from 'react-native';
import api from './services/api.js';

export default class App extends React.Component {
  componentDidMount(){
    this.randomCard();
  }

  randomCard = () => {
    api
      .get('/translations/random')
      .then((response) => response.data)
      .then(console.log);
  };
  render() {
    return (
      <View style={styles.container}>
        <Text>Open up App.js to start working on your app!</Text>
        <Text>Changes you make will automatically reload.</Text>
        <Text>Shake your phone to open the developer menu.</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
