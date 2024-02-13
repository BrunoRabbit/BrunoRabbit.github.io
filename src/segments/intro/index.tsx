import './style.css';
import linkedin from '../../assets/linkedin_logo.png';
import github from '../../assets/github_logo.png';
import { textStyles } from '../../styles/text_style';

function Intro() {
  return (
    <section>
      <header className="App-header">
        <div>
          <p style={textStyles.title}>HI 👋 MY NAME IS BRUNO </p>
          <span className='App-title'>
            <div className='title-section'>
              <span>FLUTTER</span>
              <a href='https://www.linkedin.com/in/bruno-coelho-2337741b5/'>
                <img src={linkedin} alt="linkedin" className='boxes linkedin-logo' />
              </a>
              <a href='https://github.com/BrunoRabbit'>
                <img src={github} alt="github" className='boxes github-logo' />
              </a>
            </div>
            <span>DEVELOPER</span>
          </span>
          <p style={{...textStyles.title, ...textStyles.description}}>
            I'M 23 YEARS OLD, A DEVELOPER WITH 1 YEAR <br /> OF PROFESSIONAL EXPERIENCE IN COMPANIES <br /> AND A FEW MONTHS WORKING AS A FREELANCER.
          </p>
        </div>
      </header>
    </section >
  );
}

export default Intro;
