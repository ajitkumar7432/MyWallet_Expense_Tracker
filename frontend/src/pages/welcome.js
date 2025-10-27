import { Link } from 'react-router-dom';
import '../assets/styles/welcome.css';
import Logo from '../components/utils/Logo';

function Welcome() {
  return (
    <section className="welcome-container">
      <div className="content-box">
        <Logo />

        <h1 className="headline">Your Financial Security, Our Priority</h1>
        <p className="subtext">
          Trust MyWallet to protect your assets. Bank-grade encryption and privacy
          controls ensure your data is always safe.
        </p>

        <div className="btn-group">
          <Link to="/auth/register">
            <button className="btn btn-primary">Securely Create Account</button>
          </Link>
          <Link to="/auth/login">
            <button className="btn btn-secondary">Log In</button>
          </Link>
        </div>
      </div>
    </section>
  );
}

export default Welcome;
