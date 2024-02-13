import Kiki from '../../assets/kiki-intro.png';
import Cash from '../../assets/cash-app.png';
import Pomodoro from '../../assets/pomodoro.png';
import BorderRadiusPreviewer from '../../assets/border_radius_previewer.png';
import Projects from '../../components/projects/index';
import { textStyles } from '../../styles/text_style';
import './style.css';
import '../../components/tab_bar/style.css';
import { useEffect, useRef, useState } from 'react';
import TabBar from '../../components/tab_bar';

const BodyProjects = () => {
    const [activeTab, setActiveTab] = useState<number>(1);
    const btnsRef = useRef<NodeListOf<HTMLLIElement> | null>(null);
    const indicatorRef = useRef<HTMLDivElement | null>(null);

    useEffect(() => {
        btnsRef.current = document.querySelectorAll('.tab');
        indicatorRef.current = document.querySelector('.indicator');

        const updateIndicatorWidth = () => {
            if (!indicatorRef.current || !btnsRef.current) return;

            const activeTabElement = btnsRef.current[activeTab - 1];

            if (activeTabElement) {
                const style = window.getComputedStyle(activeTabElement);
                const font = style.font;
                const text = activeTabElement.textContent || '';

                const canvas = document.createElement('canvas');
                const context = canvas.getContext('2d');
                if (context) {
                    context.font = font;
                    const metrics = context.measureText(text);
                    const textWidth = metrics.width;

                    indicatorRef.current.style.width = `${textWidth}px`;
                }
            }
        };

        if (btnsRef.current) {
            btnsRef.current.forEach(btn => {
                btn.addEventListener('mousedown', handleMouseDown);
            });
        }

        updateIndicatorWidth();

        window.addEventListener('resize', updateIndicatorWidth);
        if (btnsRef.current && btnsRef.current[activeTab - 1]) {
            handleMouseDown({ currentTarget: btnsRef.current[activeTab - 1] } as any);
        }
        return () => {
            if (btnsRef.current) {
                btnsRef.current.forEach(btn => {
                    btn.removeEventListener('mousedown', handleMouseDown);
                });
            }
            window.removeEventListener('resize', updateIndicatorWidth);
        };
    }, [activeTab]);

    const handleMouseDown = (e: MouseEvent) => {
        if (!btnsRef.current || !indicatorRef.current) return;

        const newRound = document.createElement('div');
        const x = e.pageX - (e.currentTarget as HTMLDivElement).offsetLeft;
        const y = e.pageY - (e.currentTarget as HTMLDivElement).offsetTop;

        newRound.className = 'cercle';
        (e.currentTarget as HTMLDivElement).appendChild(newRound);

        newRound.style.left = x + 'px';
        newRound.style.top = y + 'px';
        newRound.className += ' anim';

        const btnNum = parseInt((e.currentTarget as HTMLLIElement).dataset.num || '0', 10);
        const btnElement = btnsRef.current[btnNum - 1];

        if (btnElement) {
            const tabBarElement = btnElement.parentElement;
            if (tabBarElement) {
                const tabBarRect = tabBarElement.getBoundingClientRect();
                const btnRect = btnElement.getBoundingClientRect();
                const indicatorWidth = indicatorRef.current.offsetWidth;
                const btnCenter = btnRect.left + btnRect.width / 2 - tabBarRect.left;
                indicatorRef.current.style.marginLeft = `${btnCenter - indicatorWidth / 2}px`;
            }
        }

        setActiveTab(btnNum);

        setTimeout(() => {
            newRound.remove();
        }, 1200);
    };

    return (
        <div className='column'>
            <span style={{ ...textStyles.sectionTitle }}>MY PROJECTS</span>

            <TabBar indicatorRef={indicatorRef} activeTab={activeTab} />
            <div className="tab-content">
                {activeTab === 1 && <div>Conteúdo da HOME</div>}
                {activeTab === 2 && <div>Conteúdo do ABOUT</div>}
                {activeTab === 3 && <div>Conteúdo do PORTFOLIO</div>}
                {activeTab === 4 && <div>Conteúdo do SOCIAL</div>}
                {activeTab === 5 && <div>Conteúdo do CONTACT</div>}
            </div>
            {/* <div className="tabs">
                {tabs.map((tab, index) => (
                    <div
                        key={index}
                        onClick={() => setActiveTab(index)}
                        className={`tab ${index === activeTab ? 'active' : ''}`}
                    >
                        {tab}
                    </div>
                ))}
            </div>

            <div className="tab-content">
                {tabs.map((tab, index) => (
                    <div
                        key={index}
                        className={`content ${index === activeTab ? 'active' : ''}`}
                    >
                        Conteúdo da {tab}
                    </div>
                ))}
            </div> */}

            <div className='row projects'>
                <Projects
                    src={Kiki}
                    height={'60%'}
                    width={"100%"}
                    paddingTop={"5%"}
                    title='REAL CUSTOMER'
                    projectDescription='ORGANIZE ORDERS MADE BY THE EMPLOYEE'
                />

                <Projects
                    src={Cash}
                    height={'100%'}
                    width={"48%"}
                    paddingTop={"0%"}
                    title='REAL CUSTOMER'
                    projectDescription='ORGANIZE EXPENSES AND OBSERVE THE FAMILY ECONOMY'
                />
            </div>

            <div className='row projects'>
                <Projects
                    src={BorderRadiusPreviewer}
                    height={'60%'}
                    width={"100%"}
                    paddingTop={"5%"}
                    title='STUDY APP'
                    projectDescription=' USER CAN CHANGE THE 4 SIDES OF THIS BOX'
                />

                <Projects
                    src={Pomodoro}
                    height={'100%'}
                    width={"48%"}
                    paddingTop={"0%"}
                    title='REAL CUSTOMER'
                    projectDescription='ORGANIZE EXPENSES AND OBSERVE THE FAMILY ECONOMY'
                />
            </div>

        </div>

    );
}

export default BodyProjects;