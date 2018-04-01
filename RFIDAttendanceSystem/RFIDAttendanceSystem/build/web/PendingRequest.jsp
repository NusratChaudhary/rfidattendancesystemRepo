<%-- 
    Document   : PendingRequest
    Created on : 1 Apr, 2018, 10:57:55 AM
    Author     : mohnish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="Resources/favicon.png"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="CSS/mystyle.css"/>
        <link rel="stylesheet" href="CSS/animate.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br/>

        <div class="container-fluid">
            <div class="float-right">

                <div class="float-right" style="margin-right: 10px">    
                    <center>  <div class="responded rounded-circle" style="width: 20px;height: 20px"></div></center>
                    <p  >Responded</p>
                </div>
                <div class="float-right" style="margin-right: 10px">
                    <center><div class="read rounded-circle" style="width: 20px;height: 20px"></div></center>
                    <p >Read</p>
                </div>
                <div class="float-right" style="margin-right: 10px">
                    <center> <div class="pending rounded-circle" style=" width: 20px;height: 20px;"></div></center>
                    <p >Pending</p>
                </div>
            </div>
            <br/><br/>
        </div>
        <div class="container">


            <div class="card requestCard shadow-nohover" style="clear: right">
                <div class="card-header pending">
                    <span class="float-left">request Subject</span> 
                    <span class="float-right">Request Id : 1234</span>
                </div>
                <div class="card-body">
                    <div class="float-left">
                        <h6>Date : 01/04/2016</h6>

                    </div>
                    <div class="float-right">
                        <h6>Employee : Mohnish Anjaria</h6>
                        <h6>Employee Id : 0123456789</h6>
                    </div>
                    <br/>
                    <div style="clear: right">
                        <p class="requestBody">
                            It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                        </p>
                    </div>

                    <div>
                        <button class="btn btn-primary float-right" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" >
                            Reply
                        </button>
                    </div>
                    <br/><br/>
                    <div class="collapse" id="collapseExample" style="clear: right">
                        <div class="replyCard">
                            <textarea class="form-control" rows="3" placeholder="Reply ...."></textarea>
                            <br/>
                            <button class="btn btn-success float-right">Send</button>
                        </div>
                    </div>


                </div>
            </div>
            <br/>

            <div class="card requestCard shadow-nohover">
                <div class="card-header read">
                    <span class="float-left">request Subject</span> 
                    <span class="float-right">Req Id : 1234</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>

            <br/>
            <div class="card requestCard shadow-nohover" >
                <div class="card-header responded" >
                    <span class="float-left">request Subject</span> 
                    <span class="float-right">Req Id : 1234</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>

        </div>




        <script>
            $(document).ready(function () {


            });
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    </body>
</html>
