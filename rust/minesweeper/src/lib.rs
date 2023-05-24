use itertools::iproduct;
use std::cmp::min;

const STAR_BYTE: u8 = 42;
const STAR_CHAR: char = '*';

pub fn annotate(minefield: &[&str]) -> Vec<String> {

    minefield.iter()
        .enumerate()
        .map(|(i, row)| 
             row.as_bytes()
             .iter()
             .enumerate()
             .map(|(j, b)| match b {
                 &STAR_BYTE => String::from(STAR_CHAR),
                 _ => count_mines_by((i, j), minefield).to_count_string(),
             })
             .collect::<Vec<String>>().join("")
        ).collect()
    
}

fn count_mines_by(point: (usize, usize), board: &[&str]) -> usize {

    let dims: (usize, usize) = (board.len(), board[0].len());
    get_nbs(point, dims)
        .iter()
        .map(|nb| is_mine(*nb, board))
        .sum()

}

fn get_nbs((x, y): (usize, usize), (m, n): (usize, usize)) -> Vec<(usize, usize)> {
 
    let nbs_i = x.saturating_sub(1)..=min(x+1,m-1);
    let nbs_j = y.saturating_sub(1)..=min(y+1,n-1);

    iproduct!(nbs_i, nbs_j)
        .filter(|nb| nb != &(x, y))
        .collect::<Vec<_>>()

}
 
fn is_mine((x,y): (usize, usize), board: &[&str]) -> usize {

    let board_val: u8 = board[x].as_bytes()[y];
    match board_val {
        STAR_BYTE => 1,
        _ => 0,
    }
     
}

trait CountString {
    fn to_count_string(&self) -> String;
}

impl CountString for usize {
    fn to_count_string(&self) -> String {
        match self {
            0 => String::from(" "),
            _ => self.to_string(),
        }
    }
}
