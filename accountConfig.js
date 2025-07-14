import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.1/firebase-app.js";
import { getFirestore, doc, getDoc } from "https://www.gstatic.com/firebasejs/10.12.1/firebase-firestore.js";

const firebaseConfig = {
  	apiKey: "AIzaSyArDDSjt9QDPu-h2pqtO73Z1KDZrgAdMMo",
  	authDomain: "ware-de78d.firebaseapp.com",
  	projectId: "ware-de78d",
  	storageBucket: "ware-de78d.firebasestorage.app",
  	messagingSenderId: "434521846825",
  	appId: "1:434521846825:web:904d72c4e5f33a9af29838",
  	measurementId: "G-PW8T28ENKG"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
			
