<table class="table table-hover">
		<tbody>
			<tr>
				<th>서 비 스 이 용 약 관 동 의</th>
				<td>
					<div class="input-group mb-1">
						<div class="input-group-text">
							<input type="checkbox" id="service_agree" name="service_agree"
								class="mr-1" checked="checked"> 서비스 이용 약관에 동의 합니다.
						</div>
					</div> <textarea class="form-control">서비스 이용 약관</textarea> <label
					for="service_agree" id="service_agree_label"></label>
				</td>
			</tr>
			<tr>
				<th>개 인 정 보 제 공 동 의</th>
				<td>
					<div class="input-group mb-1">
						<div class="input-group-text">
							<input type="checkbox" id="info_agree" name="info_agree"
								class="mr-1" checked="checked"> 개인 정보 제공에 동의 합니다.
						</div>
					</div> <textarea class="form-control">개인 정보 제공</textarea> <label
					for="info_agree" id="info_agree_label"></label>
				</td>
			</tr>
			<tr>
				<th>S M S 수 신 동 의</th>
				<td>
					<div class="input-group">
						<div class="input-group-text">
							<input type="checkbox" id="sms_agree" name="sms_agree"
								class="mr-1" checked="checked"> SMS 수신을 동의 합니다.
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>E M A I L 수 신 동 의</th>
				<td>
					<div class="input-group">
						<div class="input-group-text">
							<input type="checkbox" id="email_agree" name="email_agree"
								class="mr-1" checked="checked"> EMAIL 수신을 동의 합니다.
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<div class="input-group">
						<input type="text" id="mname" name="mname" maxlength="20"
							class="form-control">
					</div> <label for="mname" id="mname_label"></label>
				</td>
			</tr>
			<tr>
				<th>아 이 디</th>
				<td>
					<div class="input-group">
						<input type="text" id="mid" name="mid" maxlength="20"
							class="form-control">
						<div class="input-group-append">
							<button id="id_btn" class="btn btn-primary">아 이 디 중 복 체
								크</button>
						</div>
					</div> <label for="mid" id="mid_label"></label>
				</td>
			</tr>
			<tr>
				<th>비 밀 번 호</th>
				<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
					class="form-control"> <label for="mpwd" id="mpwd_label"></label>
				</td>
			</tr>
			<tr>
				<th>비 밀 번 호 확 인</th>
				<td><input type="password" id="rempwd" name="rempwd"
					maxlength="20" class="form-control"> <label for="rempwd"
					id="rempwd_label"></label></td>
			</tr>
			<tr>
				<th>전 화 번 호</th>
				<td>
					<div class="input-group">
						<input type="text" id="tel1" name="tel1" maxlength="3"
							class="form-control" placeholder="010"> <input
							type="text" id="tel2" name="tel2" maxlength="4"
							class="form-control" placeholder="1234"> <input
							type="text" id="tel3" name="tel3" maxlength="4"
							class="form-control" placeholder="5678">
					</div> <label for="tel1" id="tel1_label"></label>
				</td>
			</tr>
			<tr>
				<th>이 메 일</th>
				<td>
					<div class="input-group">
						<input type="text" id="email1" name="email1" maxlength="25"
							class="form-control"> <span class="input-group-text">@</span>
						<input type="text" id="email2" name="email2" maxlength="25"
							class="form-control" placeholder="naver.com">
					</div> <label for="email1" id="email1_label"></label>
				</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td>
					<div class="input-group">
						<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
							id="post_code" name="post_code" readonly="readonly"
							class="form-control">
						<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
					</div>
					<div class="input-group">
						<span class="input-group-text"> 주 소 </span> <input type="text"
							id="addr1" name="addr1" readonly="readonly" class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-text"> 상 세 주 소 </span> <input type="text"
							id="addr2" name="addr2" class="form-control">
					</div>
				</td>
			</tr>
			<tr>
				<th>고양이 연령</th>
				<td>
					<div class="input-group">
						<input type="text" id="mname" name="mname" maxlength="20"
							class="form-control">
					</div> <label for="mname" id="mname_label"></label>
				</td>
			</tr>
			<tr>
				<th>고양이 성별</th>
				<td>
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="btnsex" id="btnsex1"
							value="male" autocomplete="off" checked> <label
							class="btn btn-outline-primary rounded-pill find-btn1"
							for="btnsex1">수컷</label> <input type="radio" class="btn-check"
							name="btnsex" id="btnsex2" value="female" autocomplete="off">
						<label class="btn btn-outline-primary rounded-pill find-btn2"
							for="btnsex2">암컷</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>고양이 중성화유무</th>
				<td>
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="radio" class="btn-check" name="btnYN" id="btnYN1"
							value="yes" autocomplete="off" checked> <label
							class="btn btn-outline-primary rounded-pill find-btn1"
							for="btnYN1">헀습니다</label> <input type="radio" class="btn-check"
							name="btnYN" id="btnYN2" value="no" autocomplete="off"> <label
							class="btn btn-outline-primary rounded-pill find-btn2"
							for="btnYN2">안헀습니다</label>
					</div>
				</td>
			</tr>

		</tbody>
	</table>
	<div class="clearfix">
		<a href="${pageContext.request.contextPath}/home">
			<button id="signup_btn" type="button"
				class="btn btn-primary float-right">취소</button>
		</a>

		<button id="join_btn" class="btn btn-primary float-right mr-4">
			회 원 가 입</button>
	</div>