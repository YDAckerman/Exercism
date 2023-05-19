
pub fn annotate(minefield: &[&str]) -> Vec<String> {

    minefield.iter()
        .enumerate()
        .map(|(i, row)| 
             row.as_bytes()
             .iter()
             .enumerate()
             .map(|(j, b)| match b {
                 42 => String::from('*'),
                 _ => count_to_string(
                     count_mines_by((i, j), minefield)
                 ),
             })
             .collect::<Vec<String>>().join("")
        ).collect()
    
}

fn count_to_string(count: usize) -> String {
    match count {
        0 => String::from(" "),
        _ => count.to_string(),
    }
}

fn count_mines_by(point: (usize, usize), board: &[&str]) -> usize {

    let dims: (usize, usize) = (board.len(), board[0].len());
    get_nbs(point, dims)
        .iter()
        .map(|nb| is_mine(*nb, board))
        .sum()

}

fn get_nbs((x, y): (usize, usize), (m, n): (usize, usize)) -> Vec<(usize, usize)> {
 
    let nbs: Vec<(i32, i32)> = vec![(-1, -1), (-1, 0), (0, -1),
                                    (-1, 1), (1, 1), (1, 0),
                                    (0, 1), (1, -1)];
    nbs.into_iter()
        .map(|(i, j)| (i + (x as i32), j + (y as i32)))
        .filter(|(i, j)| (i >= &0) & (i < &(m as i32)) 
                & (j >= &0) & (j < &(n as i32)))
        .map(|(i, j)| (i as usize, j as usize))
        .collect::<Vec<_>>()
                      
}
 
fn is_mine((x,y): (usize, usize), board: &[&str]) -> usize {

    let board_val: u8 = board[x].as_bytes()[y];
    match board_val {
        42 => 1,
        _ => 0,
    }
     
}

trait CountString {
    fn to_count_string(&self) -> String;
}


