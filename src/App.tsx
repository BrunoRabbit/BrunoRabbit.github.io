import Intro from './segments/intro';
import "./App.css";
import BodyProjects from './segments/body_projects';
// import Trees from './components/trees';

function App() {
  return (
    <div>
      <Intro />
      <section >
        <div className='gradientColor'>
          {/* <Trees /> */}
          <BodyProjects />

        </div>
      </section >
    </div >
  );
}

export default App;
