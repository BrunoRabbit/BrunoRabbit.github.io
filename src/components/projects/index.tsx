import "./style.css";
import { textStyles } from "../../styles/text_style";

interface Props {
    src: string;
    height: string | number;
    width: string | number;
    paddingTop: string | number;
    title: string;
    projectDescription: string;
}

const Projects = ({ src, height, width, paddingTop, title, projectDescription }: Props) => {
    return (
        <div className="container">
            <img src={src} height={height} width={width} alt='' />
            <div style={{ textAlign: 'center', paddingTop: paddingTop }}>
                <span>{title}</span>
                <span style={textStyles.titleProject}><br />{projectDescription}</span>
            </div>
        </div>
    );
}

export default Projects;