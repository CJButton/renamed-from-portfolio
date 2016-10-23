import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {result: 0, num1: "", num2: "", history: []};

    // we must set 'this', otherwise when it gets to setNum1, it will be
    // 'undefined', and not set to Calculator
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.handlePlus = this.handlePlus.bind(this);
    this.handleMinus = this.handleMinus.bind(this);
    this.handleClear = this.handleClear.bind(this);
  }


  setNum1(event) {
    let arr = this.state.history;
    console.log(arr);
    let updatedHistory = arr.push(parseInt(event.target.value, 10));
    this.setState({num1: parseInt(event.target.value, 10),
                                            history: updatedHistory});
  }

  setNum2(event) {
    this.setState({num2: parseInt(event.target.value, 10)});
  }

  handlePlus(event) {
    event.preventDefault();
    let result = this.state.num1 + this.state.num2;
    this.setState({result: result});
  }

  handleMinus(event) {
    event.preventDefault();
    let result = this.state.num1 - this.state.num2;
    this.setState({result: result});
  }

  handleClear(event){
    event.preventDefault();
    let num1 = this.state.num1 = "";
    let num2 = this.state.num2 = "";
    let result = this.state.result = 0;
    this.setState({num1: num1, num2: num2, result: result});
  }

  render() {
    return (
      <div>
        <input type="text" placeholder="Enter a number!"
          value={this.state.num1} onChange={this.setNum1} />

        <input type="text" placeholder="Enter another number!"
          value={this.state.num2} onChange={this.setNum2} />



  
        <br />
        <button onClick={this.handlePlus}>+</button>
        <button onClick={this.handleMinus}>-</button>
        <p>{this.state.result}</p>
        <button onClick={this.handleClear}>Clear</button>
        <p>{this.state.history}</p>
      </div>
    );
  }
}

export default Calculator;
// we have to make sure that the export is the last thing written
