<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

.about-container{
    width:100%;
    padding:1vw;
}

.about-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    gap:3vw;
    background:white;
    border-radius:20px;
    padding:2vw;
    margin-bottom:3vh;
    box-shadow:0 4px 15px rgba(0,0,0,0.05);
}

.about-header-text{
    flex:1;
}

.about-header-text h1{
    font-size:2.5vw;
    color:#222;
    margin-bottom:1vh;
}

.about-header-text p{
    color:#666;
    line-height:1.8;
}

.about-header img{
    width:28vw;
    object-fit:cover;
}

.mission-card{
    display:flex;
    align-items:center;
    gap:1.5vw;
    background:#fff4ec;
    border-left:5px solid #ff6b00;
    padding:1.5vw;
    border-radius:15px;
    margin-bottom:4vh;
}

.mission-icon{
    width:60px;
    height:60px;
    border-radius:50%;
    background:#ff6b00;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:28px;
}

.mission-content h3{
    color:#222;
    margin-bottom:0.5vh;
}

.mission-content p{
    color:#666;
}

.team-section{
    margin-top:3vh;
}

.team-title{
    text-align:center;
    margin-bottom:4vh;
}

.team-title h2{
    font-size:2vw;
    color:#222;
}

.team-title p{
    color:#777;
    margin-top:1vh;
}

.team-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:2vw;
}

.member-card{
    background:white;
    padding:2vw;
    border-radius:20px;
    box-shadow:0 4px 15px rgba(0,0,0,0.05);
    transition:0.3s;
}

.member-card:hover{
    transform:translateY(-5px);
}

.member-header{
    display:flex;
    align-items:center;
    gap:1vw;
    margin-bottom:2vh;
}

.member-header img{
    width:80px;
    height:80px;
    border-radius:50%;
    object-fit:cover;
}

.member-info h4{
    color:#222;
    margin-bottom:0.5vh;
    font-size:15px;
}

.member-info span{
    color:#ff6b00;
    font-weight:400;
    font-size:15px;
}

.member-card ul{
    padding-left:1.2vw;
}

.member-card li{
    color:#666;
    margin-bottom:1vh;
}

.passion-card{
    margin-top:4vh;
    background:white;
    padding:2vw;
    border-radius:20px;
    display:flex;
    align-items:center;
    gap:1.5vw;
    box-shadow:0 4px 15px rgba(0,0,0,0.05);
}

.passion-icon{
    font-size:40px;
}

.passion-content h3{
    color:#ff6b00;
    margin-bottom:1vh;
}

.passion-content p{
    color:#666;
    line-height:1.8;
}

</style>

<div class="about-container">

    <!-- HEADER -->

    <div class="about-header">

        <div class="about-header-text">

            <h1>About Ramijo Restaurant</h1>

            <p>
                Ramijo Restaurant is a modern restaurant management and
                online ordering platform designed to provide customers
                with a simple, fast, and enjoyable dining experience.
                Our goal is to combine quality food, excellent service,
                and innovative technology.
            </p >

        </div>

        <img src="/images/resto.png"
             alt="Restaurant">

    </div>

    <!-- MISSION -->

    <div class="mission-card">

        <div class="mission-icon">
            ❤
        </div>

        <div class="mission-content">

            <h3>Our Mission</h3>

            <p>
                To simplify restaurant ordering and management while
                delivering exceptional customer experiences through
                innovation, quality, and reliability.
            </p >

        </div>

    </div>

    <!-- TEAM -->

    <div class="team-section">

        <div class="team-title">

            <h2>Project Team</h2>

            <p>
                Meet the people behind Ramijo Restaurant.
            </p >

        </div>

        <div class="team-grid">

            <!-- MEMBER 1 -->

            <div class="member-card">

                <div class="member-header">

                    <img src="/images/raissa.jpg" alt="Member">

                    <div class="member-info">

                        <h4>TIMMEU RAISSA CARELLE</h4>

                        <span>Frontend Developer</span>

                    </div>

                </div>

                <ul>
                    <li>User Interface Design</li>
                    <li>User Experience Optimization</li>
                    <li>JSP Frontend Integration</li>
                </ul>

            </div>

            <!-- MEMBER 2 -->

            <div class="member-card">

                <div class="member-header">

                    <img src="/images/mike.jpg" alt="Member">

                    <div class="member-info">

                        <h4>TONJE NDEBI MIKE JOANE</h4>

                        <span>Backend Developer</span>

                    </div>

                </div>

                <ul>
                    <li>Project Planning</li>
                    <li>Servlet Development</li>
                    <li>Business Logic Implementation</li>

                </ul>

            </div>

            <!-- MEMBER 3 -->

            <div class="member-card">

                <div class="member-header">

                    <img src="/images/jordan.jpg" alt="Member">

                    <div class="member-info">

                        <h4>MBAYI TONGUE JORDAN STEVE</h4>

                        <span>Database Administrator</span>

                    </div>

                </div>

                <ul>
                    <li>Database Design</li>
                    <li>Quality Assurance</li>
                    <li>JSP Frontend Integration</li>

                </ul>

            </div>

        </div>

    </div>

    <!-- PASSION -->

    <div class="passion-card">

        <div class="passion-icon">
            🍽
        </div>

        <div class="passion-content">

            <h3>A Shared Passion</h3>

            <p>
                By combining our expertise in software engineering,
                design, and project management, we created Ramijo
                Restaurant to deliver a modern restaurant experience
                that connects customers and restaurants seamlessly.
            </p >

        </div>

    </div>

</div>