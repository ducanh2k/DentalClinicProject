import jwtDecode from "jwt-decode";

// const token = localStorage.getItem('yourTokenKey');
// console.log(user, role);
export function getUserFromToken(token) {
  try {
    return jwtDecode(token);
  } catch (error) {
    console.error("Decoding token failed", error);
    return null;
  }
}
