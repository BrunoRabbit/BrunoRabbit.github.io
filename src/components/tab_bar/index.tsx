import './style.css';

type ref = React.MutableRefObject<HTMLDivElement | null>;

interface Props {
    indicatorRef: ref, 
    activeTab: number,
}

const TabBar = ({ indicatorRef, activeTab }: Props) => {
    return (
        <ul className="tab-bar">
            <li data-num="1" className={`tab ${activeTab === 1 ? 'dark' : 'grey'}`}>MIXED</li>
            <li data-num="2" className={`tab ${activeTab === 2 ? 'dark' : 'grey'}`}>WEB</li>
            <li data-num="3" className={`tab ${activeTab === 3 ? 'dark' : 'grey'}`}>MOBILE</li>
            <div className="indicator" ref={indicatorRef}></div>
        </ul>
    );
}

export default TabBar;