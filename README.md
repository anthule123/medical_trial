# Xây dựng model cho việc điều trị tiểu đường (theo kiểu bottom up)

```dart
const like = 'sample';
```
## 1. class MedicalAction:
    - ý nghĩa: là hoạt động y tế, có thể là kiểm tra đường máu, hoặc tiêm,...
    - có attribute là time.
    - time có cấu trúc dữ liệu là DataTime ở Dart và String ở database.
    Có 2 class kế thừa từ class này là class kiểm tra đường máu, và class tiêm insulin
   ### 1.1. class MedicalCheckGlucose
       - Có thêm attribute là glucoseUI : lượng glucose đo được.
   ### 1.2. class MedicalTakeInsulin
       - Có thêm attribute là loại Insulin tiêm vào: 1 trong 3 loại: Actrapid, Glagrine, NPH, có thể 
         để type là String ở database và để là enum ở dart.
       - Có attribute là lượng Insulin tiêm vào.
## 2. class Regimen
    - ý nghĩa: là một phác đồ điều trị, bao gồm một danh sách các hoạt động y tế
    - có attribute là name và danh sách các MedicalAction, MedicalCheckInsulin, MedicalTakeInsulin.
    - Có function là: 
        + Thêm hoạt động y tế vào
## 3. class Patient
    - ý nghĩa: là bệnh nhân và các thông tin liên quan
    - attribute là name, id, weight, và danh sách regimens.
    - và vài attribute là các thông tin cá nhân khác.
 
 # 0. debug và test các class này, từ dễ đến khó (1->3).
    0. Xem cách tạo và debug project dart ở
  [debug dart](https://www.youtube.com/watch?v=H-QKneVNOhE&t=536s)
  
    1. Xem về cách test ở 
  [how to test](https://www.youtube.com/watch?v=cVru6Gy4duQ&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o&index=6 )
  
    2. Các class đều kế thừa từ class Equatable để check ==.
    
    
    3. print class thì viết hàm đè toString()   
   [https://coflutter.com/dart-how-to-print-an-object/]
   
    4. runtimetype thì sẽ là tên class.
    
    
 # 4. Kết quả debug
    Cho dấu hỏi vào trước các biến nullable để ko xảy ra lỗi.
   
   
Thôi chắc phải học (lại) dart ở  
[https://www.youtube.com/playlist?list=PLptHs0ZDJKt_fLp8ImPQVc1obUJKDSQL7]
# Update 1/12/22:
   Đã test xong 2 class MedicalAction và MedicalCheckGlucose ở thư mục test.
  1. Nếu copy bình thường:
        ```dart
         MedicalAction a = MedicalAction(time: DateTime(2022));
         MedicalAction b = a;
        ``` 
    Thì sẽ bị copy luôn cả địa chỉ nên nếu giá trị b đổi thì a cũng đổi theo và ngược lại.
    Ta phải tạo method clone để deepcopy.
  2. Copy 1 list gồm toàn các MedicalAction 
      Cách 1: 
         ```dart
           MedicalAction a = MedicalAction(time: DateTime(2022));
           List<MedicalAction> r1 = [a.clone()];
           List<MedicalAction> r2 = r1;
         ``` 
         Cách này sẽ làm cho mọi thay đổi ở list r1 sẽ thay đổi trong r2 nên ko là deep copy.
         
           
