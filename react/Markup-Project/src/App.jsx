import { createRoot } from "react-dom/client"
import Header from "./components/Header/Header.jsx"
import Main from "./components/Main/Main.jsx"

import "./App.css"
const root = createRoot(document.getElementById("root"));
root.render(
	<body>
		<Header />
		<Main />
	</body>
);
