<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="<c:url value="/user/styles/acc_setting.css"/> " />
    <title>Travel Booking</title>
  </head>
  <body>
    <div class="container rounded bg-white mt-5 mb-5">
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-5">
          <div class="p-3 py-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
              <h4 class="text-right">Thông tin cá nhân</h4>
            </div>
            <div class="row mt-2">
              <div class="col-md-12">
                <label class="labels">Tên</label
                ><input type="text" class="form-control" p value="" />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-12">
                <label class="labels">Số điện thoại</label
                ><input
                  type="text"
                  class="form-control"
                  placeholder="012345xxx"
                  value=""
                />
              </div>
              <div class="col-md-12">
                <label class="labels">Địa chỉ</label
                ><input
                  placeholder="12 Lê Lai"
                  type="text"
                  class="form-control"
                  value=""
                />
              </div>
              <div class="col-md-12">
                <label class="labels">Email</label
                ><input
                  type="text"
                  class="form-control"
                  placeholder="travelbooking@gmail.com"
                  value=""
                />
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-md-12">
                <label class="labels">Country</label
                ><input
                  type="text"
                  class="form-control"
                  placeholder="Viet Nam"
                  value=""
                />
              </div>
            </div>
            <div class="mt-5 text-center">
              <button class="btn btn-primary profile-button" type="button">
                Save Profile
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
