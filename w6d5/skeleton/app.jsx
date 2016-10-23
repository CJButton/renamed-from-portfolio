// these files are imported into the 'entry' point
// this is listed in our webpack.config.js, so it knows to look here firsts
// notice that they have the same name as the class
// and these are used later in
// the code, to access them

//* no .jsx is needed at the end of each line!
// some are modules we have imported, others we have made ourselves
import React from 'react';
import ReactDOM from 'react-dom';
// import the calculator component in so we can use it
import Calculator from './calculator.jsx';
import Congrats from './congrats';

// the addEventListener takes in
document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	ReactDOM.render(<Calculator/>, root);
});
// ReactDOM.render(reactElement, domContainerNode)

// line 15 and 16 work toegher;
// 15 will go to the html document, and find any html with the id="id"
// 16 then will call render ON ReactDOM, and give it two params;
// the first will is the reactElement (the things we want to add!)
// and the second param is the location we want it placed on the html
// page








// DOMContentLoaded event is fired when the initial HTML document has
 // been completely loaded and parsed, without waiting for stylesheets,
 // images, and subframes to finish loading
