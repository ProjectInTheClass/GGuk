import UIKit

class MyPickerView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let foods = ["오늘 뭐먹지>","냉면","삼겹살","소고기","치킨","돌솥비빔밥","초밥","볶음밥","생선구이","라멘","제육볶음","김치찌개","부대찌개","알밥","알탕","오무라이스","김밥","쫄면","콩나물국밥","칼국수","갈비탕","먹고 죽은 귀신이 때깔도 좋다.","타코야끼","타코", "비빔면","아귀찜","닭볶음탕", "찜닭","돈부리","오코노미야끼","설렁탕","삼계탕","불고기","소바","우동","떡볶이","튀김","오늘 먹을 치킨을 내일로 미루지 말자.","오뎅","오돌뼈","족발","뼈다귀 해장국","곱창","닭발","보쌈","갈매기살","안심","등심","갈매기살","장어덮밥","KFC","알리올리오","쌀국수","샐러드","만두","짜장면","탕수육(부먹)","마라탕","햄버거","훠궈","스테이크","로제파스타","크림파스타","토마토파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","빵","짬뽕","탕수육(찍먹)","유린기","간짜장","맥도날드-빅맥","서브웨이","커리","불닭볶음면","빙수","포테이토피자","동파육","오믈렛","힘들때 먹는 당신이 1류다","월남쌈","쌈밥","KFC","알리올리오","쌀국수","샐러드","만두","짜장면","탕수육(부먹)","빵","짬뽕","탕수육(찍먹)","유린기","맥도날드-빅맥","서브웨이","커리","닭볶음면","빙수","포테이토피자","동파육","오믈렛","힘들때 먹는 당신이 1류다","햄버거","훠궈","스테이크","로제파스타","크림파스타","토마토 파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","빵","짬뽕","탕수육(찍먹)","유린기","간짜장","맥도날드-빅맥","서브웨이","커리","불닭볶음면","빙수","포테이토피자","스테이크", "로제파스타","크림파스타","토마토 파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","냉면","삼겹살","소고기","치킨","돌솥비빔밥","초밥","볶음밥","생선구이","라멘","제육볶음","김치찌개","부대찌개","알밥","알탕","오무라이스","김밥","쫄면","콩나물국밥","칼국수","갈비탕","먹고 죽은 귀신이 때깔도 좋다.","타코야끼","타코", "비빔면","아귀찜","닭볶음탕", "찜닭","돈부리","오코노미야끼","설렁탕","삼계탕","불고기","소바","우동","떡볶이","튀김","오늘 먹을 치킨을 내일로 미루지 말자.","오뎅","오돌뼈","족발","뼈다귀 해장국","곱창","닭발","보쌈","갈매기살","안심","등심","갈매기살","장어덮밥","냉면","삼겹살","소고기","치킨","돌솥비빔밥","초밥","볶음밥","생선구이","라멘","제육볶음","김치찌개","부대찌개","알밥","알탕","오무라이스","김밥","쫄면","콩나물국밥","칼국수","갈비탕","먹고 죽은 귀신이 때깔도 좋다.","타코야끼","타코", "비빔면","아귀찜","닭볶음탕", "찜닭","돈부리","오코노미야끼","설렁탕","삼계탕","불고기","소바","우동","떡볶이","튀김","오늘 먹을 치킨을 내일로 미루지 말자.","오뎅","오돌뼈","족발","뼈다귀 해장국","곱창","닭발","보쌈","갈매기살","안심","등심","갈매기살","장어덮밥","KFC","알리올리오","쌀국수","샐러드","만두","짜장면","탕수육(부먹)","마라탕","햄버거","훠궈","스테이크","로제파스타","크림파스타","토마토파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","빵","짬뽕","탕수육(찍먹)","유린기","간짜장","맥도날드-빅맥","서브웨이","커리","불닭볶음면","빙수","포테이토피자","동파육","오믈렛","힘들때 먹는 당신이 1류다","월남쌈","쌈밥","KFC","알리올리오","쌀국수","샐러드","만두","짜장면","탕수육(부먹)","빵","짬뽕","탕수육(찍먹)","유린기","맥도날드-빅맥","서브웨이","커리","닭볶음면","빙수","포테이토피자","동파육","오믈렛","힘들때 먹는 당신이 1류다","햄버거","훠궈","스테이크","로제파스타","크림파스타","토마토 파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","빵","짬뽕","탕수육(찍먹)","유린기","간짜장","맥도날드-빅맥","서브웨이","커리","불닭볶음면","빙수","포테이토피자","스테이크", "로제파스타","크림파스타","토마토 파스타","맛있게 먹으면 0칼로리","월남쌈","쌈밥","피자","칠리새우","냉면","삼겹살","소고기","치킨","돌솥비빔밥","초밥","볶음밥","생선구이","라멘","제육볶음","김치찌개","부대찌개","알밥","알탕","오무라이스","김밥","쫄면","콩나물국밥","칼국수","갈비탕","먹고 죽은 귀신이 때깔도 좋다.","타코야끼","타코", "비빔면","아귀찜","닭볶음탕", "찜닭","돈부리","오코노미야끼","설렁탕","삼계탕","불고기","소바","우동","떡볶이","튀김","오늘 먹을 치킨을 내일로 미루지 말자.","오뎅","오돌뼈","족발","뼈다귀 해장국","곱창","닭발","보쌈","갈매기살","안심","등심","갈매기살","장어덮밥","천천히한번더 돌려보세요:)"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = foods[row]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. = PickerView1()
        label.font = UIFont(name: "Silkscreen-Expanded", size: 20)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
