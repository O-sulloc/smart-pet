<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-3">
		<main>
			<div class="py-5 text-center">
				<h2>반려동물 등록 페이지</h2>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-8">
					<div class="alert alert-success align-items-center" role="alert">
						Enter your pet's information
					</div>
					
					<form action="petAdd" method="post">
						<div class="row g-3 justify-content-center">							
							<div>
								<div class="col-sm-6">
									<label for="petName" class="form-label">petName</label>
									<input id="petName" class="form-control" name="petName">
								</div>
							</div>
							
							<div class="col-sm-12">
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="petKind" value="0" name="petKind">
									<label class="form-check-label" for="petKind0">dog</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="petKind" value="1" name="petKind">
									<label class="form-check-label" for="petKind1">cat</label>
								</div>
							</div>
							<div class="col-sm-12">	
								<label for="petBirth" class="form-label">PetBirth</label>
								<input type="date" id="petBirth" name="petBirth" min="2000-01-01" max="">
							</div>
							<div class="col-sm-12">	
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="petSex" value="0" name="petSex">
									<label class="form-check-label" for="petSex0">여</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="petSex" value="1" name="petSex">
									<label class="form-check-label" for="petSex1">남</label>
								</div>
							</div>
							

							<hr class="my-4">
							
							<button class="w-100 btn btn-success btn-lg mb-5" type="submit">등록</button>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>
	
	<script type="text/javascript">
		let now_utc = Date.now()	//현재 날짜를 밀리초로 반환
		let timeOff = new Date().getTimezoneOffset()*60000; 	//분 단위를 밀리초로 변환
		let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		// new Date(now_utc-timeOff).toISOString()으로 '2022-05-12T14:09:38.134Z'를 반환받음
		// 거기서 T를 기준으로 split하고 T 앞부분인 날짜를 today에 저장한다
		
		document.getElementById("petBirth").setAttribute("max", today);
		//날짜 지정 max에 today를 넣음으로써 오늘 이후의 날짜는 선택하지 못하게 한다.
	</script>
	
	<!-- bootstrap -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>