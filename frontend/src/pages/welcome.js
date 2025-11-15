import { Link } from 'react-router-dom';
import '../assets/styles/welcome.css';
import Logo from '../components/utils/Logo';

function Welcome() {
  return (
    <section className="welcome-container">
      <div className="content-box">
        <Logo />

        <h1 className="headline">Track Smart, Spend Wise, Save More</h1>
        <p className="subtext">
          Take control of your finances with MyWallet. Beautiful insights, powerful
          budgets, and secure tracking help you achieve your financial goals.
        </p>

        <div className="btn-group">
          <Link to="/auth/register">
            <button className="btn btn-primary">Create Account</button>
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
